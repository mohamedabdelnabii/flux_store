import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/wishlist/data/models/wishlist_response.dart';
import 'package:flux_store/features/wishlist/domain/repositories/wishlist_repository.dart';

class GetWishlistUseCase {
  final WishlistRepository _repository;
  GetWishlistUseCase(this._repository);
  Future<ApiResult<WishlistResponse>> call() => _repository.getWishlist();
}

class AddToWishlistUseCase {
  final WishlistRepository _repository;
  AddToWishlistUseCase(this._repository);
  Future<ApiResult<WishlistResponse>> call(String productId) =>
      _repository.addToWishlist(productId);
}

class RemoveFromWishlistUseCase {
  final WishlistRepository _repository;
  RemoveFromWishlistUseCase(this._repository);
  Future<ApiResult<WishlistResponse>> call(String id) =>
      _repository.removeFromWishlist(id);
}
