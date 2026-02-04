import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/products/domain/repositories/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository _repository;

  GetProductsUseCase(this._repository);

  Future<ApiResult<ProductResponse>> call({
    String? sort,
    int? limit,
    int? page,
    String? categoryId,
    String? brandId,
    int? minPrice,
    int? maxPrice,
  }) {
    return _repository.getProducts(
      sort: sort,
      limit: limit,
      page: page,
      categoryId: categoryId,
      brandId: brandId,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }
}
