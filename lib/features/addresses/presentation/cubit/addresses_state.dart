import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'addresses_state.freezed.dart';

@freezed
class AddressesState with _$AddressesState {
  const factory AddressesState.initial() = _Initial;
  const factory AddressesState.loading() = Loading;
  const factory AddressesState.success(AddressResponse addressResponse) =
      Success;
  const factory AddressesState.error({required String error}) = Error;
}
