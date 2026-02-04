import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;

  @GET(ApiConstants.cart)
  Future<CartResponse> getCart();

  @POST(ApiConstants.cart)
  Future<CartResponse> addToCart(@Field("productId") String productId);

  @PUT("${ApiConstants.cart}/{id}")
  Future<CartResponse> updateCartItemQuantity(
    @Path("id") String id,
    @Field("count") int count,
  );

  @DELETE("${ApiConstants.cart}/{id}")
  Future<CartResponse> removeFromCart(@Path("id") String id);

  @DELETE(ApiConstants.cart)
  Future<void> clearCart();
}
