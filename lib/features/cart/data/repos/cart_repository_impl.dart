import 'package:hive/hive.dart';
import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/cart/data/apis/cart_api_service.dart';
import 'package:flux_store/features/cart/data/models/cart_item_model.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';
import 'package:flux_store/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartApiService _apiService;
  final Box<CartItemModel> _cartBox = Hive.box<CartItemModel>('cart_box');

  CartRepositoryImpl(this._apiService);

  @override
  Future<ApiResult<CartResponse>> getCart() async {
    try {
      final response = await _apiService.getCart();

      // Update local cache
      await _cartBox.clear();
      if (response.data?.products != null) {
        for (var item in response.data!.products!) {
          if (item.id != null) {
            await _cartBox.put(item.id!, _mapToCartItemModel(item));
          }
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      // Return cached cart items if network call fails
      if (_cartBox.isNotEmpty) {
        final cachedItems = _cartBox.values.toList();
        return ApiResult.success(
          CartResponse(
            status: 'success',
            data: CartData(
              products: [],
              totalCartPrice: cachedItems.fold<double>(
                0.0,
                (sum, item) => sum + (item.price * item.quantity),
              ),
            ),
          ),
        );
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CartResponse>> addToCart(String productId, {int? count}) async {
    try {
      final response = await _apiService.addToCart(productId, count);

      // Sync cache
      if (response.data?.products != null) {
        await _cartBox.clear();
        for (var item in response.data!.products!) {
          if (item.id != null) {
            await _cartBox.put(item.id!, _mapToCartItemModel(item));
          }
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CartResponse>> updateCartItemQuantity(
    String id,
    int count,
  ) async {
    try {
      final response = await _apiService.updateCartItemQuantity(id, count);

      // Sync cache
      if (response.data?.products != null) {
        await _cartBox.clear();
        for (var item in response.data!.products!) {
          if (item.id != null) {
            await _cartBox.put(item.id!, _mapToCartItemModel(item));
          }
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CartResponse>> removeFromCart(String id) async {
    try {
      final response = await _apiService.removeFromCart(id);

      // Sync cache
      await _cartBox.delete(id);
      if (response.data?.products != null) {
        await _cartBox.clear();
        for (var item in response.data!.products!) {
          if (item.id != null) {
            await _cartBox.put(item.id!, _mapToCartItemModel(item));
          }
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> clearCart() async {
    try {
      await _apiService.clearCart();
      await _cartBox.clear();
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  CartItemModel _mapToCartItemModel(CartProductItem item) {
    return CartItemModel(
      id: item.id ?? '',
      productId: item.product?.id ?? '',
      name: item.product?.title ?? '',
      image: item.product?.imageCover ?? '',
      price: (item.price ?? 0).toDouble(),
      quantity: item.count ?? 1,
    );
  }
}
