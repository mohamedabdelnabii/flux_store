import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';

abstract class CartRepository {
  Future<ApiResult<CartResponse>> getCart();
  Future<ApiResult<CartResponse>> addToCart(String productId, {int? count});
  Future<ApiResult<CartResponse>> updateCartItemQuantity(String id, int count);
  Future<ApiResult<CartResponse>> removeFromCart(String id);
  Future<ApiResult<void>> clearCart();
}
