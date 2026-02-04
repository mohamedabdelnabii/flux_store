import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/brands/data/models/brand_response.dart';
import 'package:flux_store/features/brands/domain/repositories/brands_repository.dart';

class GetBrandDetailsUseCase {
  final BrandsRepository _repository;

  GetBrandDetailsUseCase(this._repository);

  Future<ApiResult<BrandResponse>> call(String id) {
    return _repository.getBrandDetails(id);
  }
}
