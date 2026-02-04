import 'package:hive/hive.dart';
import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/home/data/apis/home_api_service.dart';
import 'package:flux_store/features/home/data/models/home_response.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  final Box<HomeResponse> _homeBox = Hive.box<HomeResponse>('home_box');

  HomeRepo(this._homeApiService);

  Future<ApiResult<HomeResponse>> getHomeData() async {
    // Check for cached data first
    if (_homeBox.isNotEmpty) {
      final cachedData = _homeBox.get('home_data');
      if (cachedData != null) {
        // We could return this immediately, but usually we want to fetch fresh data too.
        // For now, let's just make it available for the UI to consume.
      }
    }

    try {
      final categoriesRes = await _homeApiService.getCategories();
      final productsRes = await _homeApiService.getProducts();

      final homeResponse = HomeResponse(
        categories: categoriesRes.data ?? [],
        products: productsRes.data ?? [],
      );

      // Save to cache
      await _homeBox.put('home_data', homeResponse);

      return ApiResult.success(homeResponse);
    } catch (error) {
      // If error, try returning cached data
      if (_homeBox.isNotEmpty) {
        final cachedData = _homeBox.get('home_data');
        if (cachedData != null) {
          return ApiResult.success(cachedData);
        }
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  HomeResponse? getCachedHomeData() {
    return _homeBox.get('home_data');
  }
}
