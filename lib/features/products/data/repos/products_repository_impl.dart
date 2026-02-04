import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_error_model.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/products/data/apis/products_api_service.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService _apiService;

  ProductsRepositoryImpl(this._apiService);

  @override
  Future<ApiResult<ProductResponse>> getProducts({
    String? sort,
    int? limit,
    int? page,
    String? categoryId,
    String? brandId,
    int? minPrice,
    int? maxPrice,
  }) async {
    try {
      final response = await _apiService.getProducts(
        sort: sort,
        limit: limit,
        page: page,
        categoryId: categoryId,
        brandId: brandId,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductModel>> getProductDetails(String id) async {
    try {
      final response = await _apiService.getProductDetails(id);
      if (response.data != null) {
        return ApiResult.success(response.data!);
      } else {
        return ApiResult.failure(
          ApiErrorModel(message: "Product details not available"),
        );
      }
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
