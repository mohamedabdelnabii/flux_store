import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:retrofit/retrofit.dart';

part 'addresses_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AddressesApiService {
  factory AddressesApiService(Dio dio, {String baseUrl}) = _AddressesApiService;

  @GET(ApiConstants.addresses)
  Future<AddressResponse> getAddresses();

  @POST(ApiConstants.addresses)
  Future<AddressResponse> addAddress(@Body() AddressModel address);

  @DELETE("${ApiConstants.addresses}/{id}")
  Future<AddressResponse> removeAddress(@Path("id") String id);
}
