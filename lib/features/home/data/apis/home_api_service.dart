import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/categories/data/models/category_response.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(ApiConstants.categories)
  Future<CategoryResponse> getCategories();

  @GET(ApiConstants.products)
  Future<ProductResponse> getProducts();
}
