import 'package:hive/hive.dart';
import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/wishlist/data/apis/wishlist_api_service.dart';
import 'package:flux_store/features/wishlist/data/models/wishlist_response.dart';
import 'package:flux_store/features/wishlist/domain/repositories/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistApiService _apiService;
  final Box<ProductModel> _wishlistBox = Hive.box<ProductModel>('wishlist_box');

  WishlistRepositoryImpl(this._apiService);

  @override
  Future<ApiResult<WishlistResponse>> getWishlist() async {
    try {
      final response = await _apiService.getWishlist();

      // Update local cache
      await _wishlistBox.clear();
      if (response.data != null) {
        for (var product in response.data!) {
          await _wishlistBox.put(product.id, product);
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      // Return cached items if request fails
      if (_wishlistBox.isNotEmpty) {
        return ApiResult.success(
          WishlistResponse(
            status: 'success',
            count: _wishlistBox.length,
            data: _wishlistBox.values.toList(),
          ),
        );
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<WishlistResponse>> addToWishlist(String productId) async {
    try {
      final response = await _apiService.addToWishlist(productId);

      // Sync local cache after adding
      if (response.data != null) {
        await _wishlistBox.clear();
        for (var product in response.data!) {
          await _wishlistBox.put(product.id, product);
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<WishlistResponse>> removeFromWishlist(String id) async {
    try {
      final response = await _apiService.removeFromWishlist(id);

      // Sync local cache after removal
      await _wishlistBox.delete(id);
      if (response.data != null) {
        await _wishlistBox.clear();
        for (var product in response.data!) {
          await _wishlistBox.put(product.id, product);
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
