part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool isProfileLoading,
    @Default(false) bool isOrdersLoading,
    @Default(false) bool isAddressesLoading,
    @Default(false) bool isCardsLoading,
    UserData? userData,
    List<OrderModel>? orders,
    List<AddressModel>? addresses,
    List<PaymentCardModel>? cards,
    String? error,
  }) = _SettingsState;
}
