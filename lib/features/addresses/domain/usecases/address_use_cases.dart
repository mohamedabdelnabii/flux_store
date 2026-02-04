import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:flux_store/features/addresses/domain/repositories/addresses_repository.dart';

class GetAddressesUseCase {
  final AddressesRepository _repository;
  GetAddressesUseCase(this._repository);
  Future<ApiResult<AddressResponse>> call() => _repository.getAddresses();
}

class AddAddressUseCase {
  final AddressesRepository _repository;
  AddAddressUseCase(this._repository);
  Future<ApiResult<AddressResponse>> call(AddressModel address) =>
      _repository.addAddress(address);
}

class RemoveAddressUseCase {
  final AddressesRepository _repository;
  RemoveAddressUseCase(this._repository);
  Future<ApiResult<AddressResponse>> call(String id) =>
      _repository.removeAddress(id);
}
