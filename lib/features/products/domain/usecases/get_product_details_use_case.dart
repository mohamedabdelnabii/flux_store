import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/products/domain/repositories/products_repository.dart';

class GetProductDetailsUseCase {
  final ProductsRepository _repository;

  GetProductDetailsUseCase(this._repository);

  Future<ApiResult<ProductModel>> call(String id) {
    return _repository.getProductDetails(id);
  }
}
