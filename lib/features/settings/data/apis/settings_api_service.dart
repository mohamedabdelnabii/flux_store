import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/settings/data/models/address_model.dart';
import 'package:flux_store/features/settings/data/models/order_model.dart';
import 'package:retrofit/retrofit.dart';

part 'settings_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SettingsApiService {
  factory SettingsApiService(Dio dio, {String baseUrl}) = _SettingsApiService;

  @GET(ApiConstants.profile)
  Future<AuthResponse> getProfile();

  @GET(ApiConstants.orders)
  Future<OrdersResponse> getOrders();

  @GET(ApiConstants.addresses)
  Future<List<AddressModel>> getAddresses();

  @POST(ApiConstants.addresses)
  Future<void> addAddress(@Body() AddressModel address);
}
