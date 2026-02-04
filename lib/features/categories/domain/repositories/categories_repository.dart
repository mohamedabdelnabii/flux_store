import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/categories/data/models/category_response.dart';

abstract class CategoriesRepository {
  Future<ApiResult<CategoryResponse>> getCategories();
  Future<ApiResult<CategoryResponse>> getCategoryDetails(String id);
  Future<ApiResult<CategoryResponse>> getSubCategoriesOnCategory(String id);
}
