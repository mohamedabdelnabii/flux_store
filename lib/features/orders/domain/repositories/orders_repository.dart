import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/orders/data/models/order_response.dart';
import 'package:flux_store/features/orders/data/models/checkout_session_response.dart';

abstract class OrdersRepository {
  Future<ApiResult<OrderModel>> createCashOrder(
    String cartId,
    ShippingAddress shippingAddress,
  );
  Future<ApiResult<CheckoutSessionResponse>> createCheckoutSession(
    String cartId,
    String successUrl,
    ShippingAddress shippingAddress,
  );
  Future<ApiResult<OrdersResponse>> getUserOrders();
}
