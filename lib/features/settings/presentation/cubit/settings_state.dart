part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = Loading;
  const factory SettingsState.profileSuccess(UserData userData) =
      ProfileSuccess;
  const factory SettingsState.ordersSuccess(List<OrderModel> orders) =
      OrdersSuccess;
  const factory SettingsState.addressesSuccess(List<AddressModel> addresses) =
      AddressesSuccess;
  const factory SettingsState.error({required String error}) = Error;
}
