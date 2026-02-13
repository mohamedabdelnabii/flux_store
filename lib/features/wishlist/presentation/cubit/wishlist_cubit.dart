import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/wishlist/domain/usecases/wishlist_use_cases.dart';
import 'wishlist_state.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/wishlist/data/models/wishlist_response.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_cubit.dart';
import 'package:flux_store/core/services/push_notification_service.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlistUseCase _getWishlistUseCase;
  final AddToWishlistUseCase _addToWishlistUseCase;
  final RemoveFromWishlistUseCase _removeFromWishlistUseCase;

  final NotificationsCubit _notificationsCubit;
  final PushNotificationService _pushService;

  WishlistCubit(
    this._getWishlistUseCase,
    this._addToWishlistUseCase,
    this._removeFromWishlistUseCase,
    this._notificationsCubit,
    this._pushService,
  ) : super(const WishlistState());

  Future<void> getWishlist() async {
    emit(state.copyWith(isLoading: true, error: null));
    final response = await _getWishlistUseCase();
    response.when(
      success: (wishlistResponse) {
        emit(
          state.copyWith(isLoading: false, wishlistResponse: wishlistResponse),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error.message ?? ""));
      },
    );
  }

  Future<void> toggleWishlist(
    String productId,
    bool currentlyInWishlist, {
    ProductModel? product,
  }) async {
    final oldResponse = state.wishlistResponse;

    if (oldResponse == null) {
      await getWishlist();
      return;
    }

    final oldList = oldResponse.products ?? [];

    // Optimistic Update
    final newList = List<ProductModel>.from(oldList);
    if (currentlyInWishlist) {
      newList.removeWhere((item) => item.id == productId);
    } else {
      if (product != null) {
        newList.add(product);
      } else {
        newList.add(ProductModel(id: productId));
      }
    }

    final optimisticResponse = WishlistResponse(
      status: oldResponse.status,
      count: newList.length,
      data: newList,
    );

    emit(state.copyWith(wishlistResponse: optimisticResponse));

    final response = currentlyInWishlist
        ? await _removeFromWishlistUseCase(productId)
        : await _addToWishlistUseCase(productId);

    response.when(
      success: (_) {
        getWishlist();
        if (!currentlyInWishlist) {
          _triggerNotification(
            title: "Added to Wishlist",
            body: "Product added to your favorites.",
            type: "wishlist",
          );
        }
      },
      failure: (error) {
        emit(state.copyWith(wishlistResponse: oldResponse));
      },
    );
  }

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
