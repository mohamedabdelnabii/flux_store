import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';
import 'package:flux_store/features/cart/domain/usecases/cart_use_cases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_cubit.dart';
import 'package:flux_store/core/services/push_notification_service.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase _getCartUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final UpdateCartQuantityUseCase _updateCartQuantityUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final ClearCartUseCase _clearCartUseCase;

  final NotificationsCubit _notificationsCubit;
  final PushNotificationService _pushService;

  CartCubit(
    this._getCartUseCase,
    this._addToCartUseCase,
    this._updateCartQuantityUseCase,
    this._removeFromCartUseCase,
    this._clearCartUseCase,
    this._notificationsCubit,
    this._pushService,
  ) : super(const CartState());

  Future<void> getCartItems() async {
    emit(state.copyWith(isLoading: true, error: null));
    final response = await _getCartUseCase();
    response.when(
      success: (cartResponse) {
        emit(state.copyWith(isLoading: false, cartResponse: cartResponse));
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error.message ?? ""));
      },
    );
  }

  Future<void> addToCart(String productId, {int? quantity}) async {
    final response = await _addToCartUseCase(productId, count: quantity);
    response.when(
      success: (_) {
        getCartItems();
        _triggerNotification(
          title: "Added to Cart",
          body: "Product added to your shopping bag.",
          type: "cart",
        );
      },
      failure: (error) => emit(state.copyWith(error: error.message ?? "")),
    );
  }

  Future<void> updateQuantity(String id, int quantity) async {
    if (quantity < 1 || quantity > 99) return;
    final response = await _updateCartQuantityUseCase(id, quantity);
    response.when(
      success: (_) => getCartItems(),
      failure: (error) => emit(state.copyWith(error: error.message ?? "")),
    );
  }

  Future<void> removeFromCart(String id) async {
    // Optimistic Update
    final oldResponse = state.cartResponse;
    if (oldResponse?.data?.products != null) {
      final updatedProducts = oldResponse!.data!.products!
          .where((item) => item.id != id)
          .toList();

      final newTotalPrice = updatedProducts.fold<num>(
        0,
        (sum, item) => sum + ((item.price ?? 0) * (item.count ?? 1)),
      );

      final optimisticResponse = CartResponse(
        status: oldResponse.status,
        numOfCartItems: updatedProducts.length,
        cartId: oldResponse.cartId,
        data: CartData(
          id: oldResponse.data!.id,
          cartOwner: oldResponse.data!.cartOwner,
          products: updatedProducts,
          createdAt: oldResponse.data!.createdAt,
          updatedAt: oldResponse.data!.updatedAt,
          v: oldResponse.data!.v,
          totalCartPrice: newTotalPrice,
        ),
      );

      emit(state.copyWith(cartResponse: optimisticResponse));
    }

    final response = await _removeFromCartUseCase(id);
    response.when(
      success: (_) => getCartItems(),
      failure: (error) {
        // Revert on failure
        emit(
          state.copyWith(cartResponse: oldResponse, error: error.message ?? ""),
        );
      },
    );
  }

  Future<void> clearCart() async {
    await _clearCartUseCase();
    emit(const CartState());
  }

  String? get cartId => state.cartResponse?.cartId;

  void _triggerNotification({
    required String title,
    required String body,
    required String type,
  }) {
    final notification = NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      body: body,
      timestamp: DateTime.now().toString().substring(11, 16),
      type: type,
      isRead: false,
    );
    _notificationsCubit.addNotification(notification);
    _pushService.showNotification(title: title, body: body);
  }
}
