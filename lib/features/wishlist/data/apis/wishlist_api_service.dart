import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/wishlist/data/models/wishlist_response.dart';
import 'package:retrofit/retrofit.dart';

part 'wishlist_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WishlistApiService {
  factory WishlistApiService(Dio dio, {String baseUrl}) = _WishlistApiService;

  @GET(ApiConstants.wishlist)
  Future<WishlistResponse> getWishlist();

  @POST(ApiConstants.wishlist)
  Future<WishlistResponse> addToWishlist(@Field("productId") String productId);

  @DELETE("${ApiConstants.wishlist}/{id}")
  Future<WishlistResponse> removeFromWishlist(@Path("id") String id);
}
