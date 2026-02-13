import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'addresses_state.freezed.dart';

@freezed
class AddressesState with _$AddressesState {
  const factory AddressesState({
    @Default(false) bool isLoading,
    AddressResponse? addressResponse,
    String? error,
  }) = _AddressesState;
}
