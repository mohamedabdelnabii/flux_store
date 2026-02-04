import 'package:hive/hive.dart';
import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/addresses/data/apis/addresses_api_service.dart';
import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:flux_store/features/addresses/domain/repositories/addresses_repository.dart';

class AddressesRepositoryImpl implements AddressesRepository {
  final AddressesApiService _apiService;
  final Box<AddressModel> _addressesBox = Hive.box<AddressModel>(
    'addresses_box',
  );

  AddressesRepositoryImpl(this._apiService);

  @override
  Future<ApiResult<AddressResponse>> getAddresses() async {
    try {
      final response = await _apiService.getAddresses();

      // Update local cache
      await _addressesBox.clear();
      if (response.data != null) {
        for (var address in response.data!) {
          if (address.id != null) {
            await _addressesBox.put(address.id, address);
          }
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      // Return cached addresses if network call fails
      if (_addressesBox.isNotEmpty) {
        return ApiResult.success(
          AddressResponse(
            status: 'success',
            data: _addressesBox.values.toList(),
          ),
        );
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AddressResponse>> addAddress(AddressModel address) async {
    try {
      final response = await _apiService.addAddress(address);

      // Sync cache
      if (response.data != null) {
        await _addressesBox.clear();
        for (var addr in response.data!) {
          if (addr.id != null) {
            await _addressesBox.put(addr.id, addr);
          }
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AddressResponse>> removeAddress(String id) async {
    try {
      final response = await _apiService.removeAddress(id);

      // Sync cache
      await _addressesBox.delete(id);
      if (response.data != null) {
        await _addressesBox.clear();
        for (var addr in response.data!) {
          if (addr.id != null) {
            await _addressesBox.put(addr.id, addr);
          }
        }
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
