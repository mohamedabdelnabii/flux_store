import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/settings/data/apis/settings_api_service.dart';
import 'package:flux_store/features/settings/data/models/address_model.dart';
import 'package:flux_store/features/settings/data/models/order_model.dart';
import 'package:flux_store/features/settings/data/models/payment_card_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
      return ApiResult.success(response.data ?? []);
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

  Future<ApiResult<List<PaymentCardModel>>> getCards() async {
    try {
      final box = await Hive.openBox<PaymentCardModel>('payment_cards');
      final cards = box.values.toList().reversed.toList();
      return ApiResult.success(cards);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> addCard(PaymentCardModel card) async {
    try {
      final box = await Hive.openBox<PaymentCardModel>('payment_cards');
      await box.add(card);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
