import 'package:flux_store/features/wishlist/data/models/wishlist_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState({
    @Default(false) bool isLoading,
    WishlistResponse? wishlistResponse,
    String? error,
  }) = _WishlistState;
}
