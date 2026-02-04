import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/categories/data/models/category_response.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio, {String baseUrl}) =
      _CategoriesApiService;

  @GET(ApiConstants.categories)
  Future<CategoryResponse> getCategories();

  @GET("${ApiConstants.categories}/{id}")
  Future<CategoryResponse> getCategoryDetails(@Path("id") String id);

  @GET("${ApiConstants.categories}/{id}/subcategories")
  Future<CategoryResponse> getSubCategoriesOnCategory(@Path("id") String id);
}
