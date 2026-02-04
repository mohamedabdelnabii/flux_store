part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.success(CartResponse cartResponse) = Success;
  const factory CartState.error({required String error}) = Error;
}
