import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/brands/data/models/brand_response.dart';

abstract class BrandsRepository {
  Future<ApiResult<BrandResponse>> getBrands();
  Future<ApiResult<BrandResponse>> getBrandDetails(String id);
}
