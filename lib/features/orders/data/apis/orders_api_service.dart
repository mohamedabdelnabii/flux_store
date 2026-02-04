import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/orders/data/models/order_response.dart';
import 'package:flux_store/features/orders/data/models/checkout_session_response.dart';
import 'package:retrofit/retrofit.dart';

part 'orders_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class OrdersApiService {
  factory OrdersApiService(Dio dio, {String baseUrl}) = _OrdersApiService;

  @POST("${ApiConstants.orders}/{cartId}")
  Future<OrderModel> createCashOrder(
    @Path("cartId") String cartId,
    @Body() ShippingAddress shippingAddress,
  );

  @POST("${ApiConstants.checkoutSession}{cartId}")
  Future<CheckoutSessionResponse> createCheckoutSession(
    @Path("cartId") String cartId,
    @Query("url") String successUrl,
    @Body() ShippingAddress shippingAddress,
  );

  @GET(ApiConstants.orders)
  Future<OrdersResponse> getUserOrders();
}
