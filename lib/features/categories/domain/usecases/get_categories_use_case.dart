import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/categories/data/models/category_response.dart';
import 'package:flux_store/features/categories/domain/repositories/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<ApiResult<CategoryResponse>> call() {
    return _repository.getCategories();
  }
}
