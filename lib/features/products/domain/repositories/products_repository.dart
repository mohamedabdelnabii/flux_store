import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';

abstract class ProductsRepository {
  Future<ApiResult<ProductResponse>> getProducts({
    String? sort,
    int? limit,
    int? page,
    String? categoryId,
    String? brandId,
    int? minPrice,
    int? maxPrice,
  });
  Future<ApiResult<ProductModel>> getProductDetails(String id);
}
