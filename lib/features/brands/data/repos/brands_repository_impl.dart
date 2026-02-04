import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/brands/data/apis/brands_api_service.dart';
import 'package:flux_store/features/brands/data/models/brand_response.dart';
import 'package:flux_store/features/brands/domain/repositories/brands_repository.dart';

class BrandsRepositoryImpl implements BrandsRepository {
  final BrandsApiService _apiService;

  BrandsRepositoryImpl(this._apiService);

  @override
  Future<ApiResult<BrandResponse>> getBrands() async {
    try {
      final response = await _apiService.getBrands();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<BrandResponse>> getBrandDetails(String id) async {
    try {
      final response = await _apiService.getBrandDetails(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
