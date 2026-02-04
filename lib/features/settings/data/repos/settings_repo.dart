import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/settings/data/apis/settings_api_service.dart';
import 'package:flux_store/features/settings/data/models/address_model.dart';
import 'package:flux_store/features/settings/data/models/order_model.dart';

class SettingsRepo {
  final SettingsApiService _settingsApiService;

  SettingsRepo(this._settingsApiService);

  Future<ApiResult<AuthResponse>> getProfile() async {
    try {
      final response = await _settingsApiService.getProfile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<OrderModel>>> getOrders() async {
    try {
      final response = await _settingsApiService.getOrders();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<AddressModel>>> getAddresses() async {
    try {
      final response = await _settingsApiService.getAddresses();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> addAddress(AddressModel address) async {
    try {
      await _settingsApiService.addAddress(address);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
