import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/categories/data/apis/categories_api_service.dart';
import 'package:flux_store/features/categories/data/models/category_response.dart';
import 'package:flux_store/features/categories/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesApiService _apiService;

  CategoriesRepositoryImpl(this._apiService);

  @override
  Future<ApiResult<CategoryResponse>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CategoryResponse>> getCategoryDetails(String id) async {
    try {
      final response = await _apiService.getCategoryDetails(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CategoryResponse>> getSubCategoriesOnCategory(
    String id,
  ) async {
    try {
      final response = await _apiService.getSubCategoriesOnCategory(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
