import 'package:hive/hive.dart';
import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/orders/data/apis/orders_api_service.dart';
import 'package:flux_store/features/orders/data/models/order_response.dart';
import 'package:flux_store/features/orders/data/models/checkout_session_response.dart';
import 'package:flux_store/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersApiService _apiService;
  final Box<OrderModel> _ordersBox = Hive.box<OrderModel>('orders_box');

  OrdersRepositoryImpl(this._apiService);

  @override
  Future<ApiResult<OrderModel>> createCashOrder(
    String cartId,
    ShippingAddress shippingAddress,
  ) async {
    try {
      final response = await _apiService.createCashOrder(
        cartId,
        shippingAddress,
      );
      // We could add the new order to the box here
      if (response.id != null) {
        await _ordersBox.put(response.id!, response);
      }
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CheckoutSessionResponse>> createCheckoutSession(
    String cartId,
    String successUrl,
    ShippingAddress shippingAddress,
  ) async {
    try {
      final response = await _apiService.createCheckoutSession(
        cartId,
        successUrl,
        shippingAddress,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<OrdersResponse>> getUserOrders() async {
    try {
      final response = await _apiService.getUserOrders();

      // Update local cache
      await _ordersBox.clear();
      if (response.data != null) {
        for (var order in response.data!) {
          if (order.id != null) {
            await _ordersBox.put(order.id!, order);
          }
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      // Return cached orders if network fails
      if (_ordersBox.isNotEmpty) {
        return ApiResult.success(
          OrdersResponse(status: 'success', data: _ordersBox.values.toList()),
        );
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
