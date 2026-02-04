import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/brands/data/models/brand_response.dart';
import 'package:retrofit/retrofit.dart';

part 'brands_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class BrandsApiService {
  factory BrandsApiService(Dio dio, {String baseUrl}) = _BrandsApiService;

  @GET(ApiConstants.brands)
  Future<BrandResponse> getBrands();

  @GET("${ApiConstants.brands}/{id}")
  Future<BrandResponse> getBrandDetails(@Path("id") String id);
}
