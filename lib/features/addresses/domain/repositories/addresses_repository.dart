import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/addresses/data/models/address_response.dart';

abstract class AddressesRepository {
  Future<ApiResult<AddressResponse>> getAddresses();
  Future<ApiResult<AddressResponse>> addAddress(AddressModel address);
  Future<ApiResult<AddressResponse>> removeAddress(String id);
}
