import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/wishlist/data/models/wishlist_response.dart';

abstract class WishlistRepository {
  Future<ApiResult<WishlistResponse>> getWishlist();
  Future<ApiResult<WishlistResponse>> addToWishlist(String productId);
  Future<ApiResult<WishlistResponse>> removeFromWishlist(String id);
}
