import 'package:flux_store/features/wishlist/data/models/wishlist_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = _Initial;
  const factory WishlistState.loading() = _Loading;
  const factory WishlistState.success(WishlistResponse wishlistResponse) =
      _Success;
  const factory WishlistState.error({required String error}) = _Error;
}
