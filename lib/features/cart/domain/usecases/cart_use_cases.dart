import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';
import 'package:flux_store/features/cart/domain/repositories/cart_repository.dart';

class GetCartUseCase {
  final CartRepository _repository;
  GetCartUseCase(this._repository);
  Future<ApiResult<CartResponse>> call() => _repository.getCart();
}

class AddToCartUseCase {
  final CartRepository _repository;
  AddToCartUseCase(this._repository);
  Future<ApiResult<CartResponse>> call(String productId) =>
      _repository.addToCart(productId);
}

class UpdateCartQuantityUseCase {
  final CartRepository _repository;
  UpdateCartQuantityUseCase(this._repository);
  Future<ApiResult<CartResponse>> call(String id, int count) =>
      _repository.updateCartItemQuantity(id, count);
}

class RemoveFromCartUseCase {
  final CartRepository _repository;
  RemoveFromCartUseCase(this._repository);
  Future<ApiResult<CartResponse>> call(String id) =>
      _repository.removeFromCart(id);
}

class ClearCartUseCase {
  final CartRepository _repository;
  ClearCartUseCase(this._repository);
  Future<ApiResult<void>> call() => _repository.clearCart();
}
