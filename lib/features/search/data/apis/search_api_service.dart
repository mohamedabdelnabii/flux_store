import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/search/data/models/search_response.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String baseUrl}) = _SearchApiService;

  @GET(ApiConstants.search)
  Future<SearchResponse> search(@Query("name") String productName); // Keep for backend search if needed

  @GET(ApiConstants.products)
  Future<SearchResponse> getProducts();
}
