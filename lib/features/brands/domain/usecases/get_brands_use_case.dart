import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/brands/data/models/brand_response.dart';
import 'package:flux_store/features/brands/domain/repositories/brands_repository.dart';

class GetBrandsUseCase {
  final BrandsRepository _repository;

  GetBrandsUseCase(this._repository);

  Future<ApiResult<BrandResponse>> call() {
    return _repository.getBrands();
  }
}
