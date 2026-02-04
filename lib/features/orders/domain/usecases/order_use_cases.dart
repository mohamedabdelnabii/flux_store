import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/orders/data/models/order_response.dart';
import 'package:flux_store/features/orders/data/models/checkout_session_response.dart';
import 'package:flux_store/features/orders/domain/repositories/orders_repository.dart';

class CreateCashOrderUseCase {
  final OrdersRepository _repository;
  CreateCashOrderUseCase(this._repository);
  Future<ApiResult<OrderModel>> call(
    String cartId,
    ShippingAddress shippingAddress,
  ) => _repository.createCashOrder(cartId, shippingAddress);
}

class CreateCheckoutSessionUseCase {
  final OrdersRepository _repository;
  CreateCheckoutSessionUseCase(this._repository);
  Future<ApiResult<CheckoutSessionResponse>> call(
    String cartId,
    String successUrl,
    ShippingAddress shippingAddress,
  ) => _repository.createCheckoutSession(cartId, successUrl, shippingAddress);
}

class GetUserOrdersUseCase {
  final OrdersRepository _repository;
  GetUserOrdersUseCase(this._repository);
  Future<ApiResult<OrdersResponse>> call() => _repository.getUserOrders();
}
