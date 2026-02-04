import 'package:hive/hive.dart';
import 'package:flux_store/core/networking/api_error_handler.dart';
import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/features/search/data/apis/search_api_service.dart';
import 'package:flux_store/features/search/data/models/search_response.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';

class SearchRepo {
  final SearchApiService _searchApiService;
  final Box<String> _historyBox = Hive.box<String>('search_history_box');

  SearchRepo(this._searchApiService);

  List<ProductModel> _cachedProducts = [];

  Future<ApiResult<SearchResponse>> search(
    String query, {
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sort,
  }) async {
    try {
      // 1. Fetch all products if cache is empty
      if (_cachedProducts.isEmpty) {
        final response = await _searchApiService.getProducts();
        _cachedProducts = response.products ?? [];
      }

      var filtered = List<ProductModel>.from(_cachedProducts);

      // 2. Filter by Query (Title or Category)
      if (query.trim().isNotEmpty) {
        final lowerQuery = query.toLowerCase().trim();
        filtered = filtered.where((product) {
          final title = (product.title ?? "").toLowerCase();
          final cat = (product.category?.name ?? "").toLowerCase();
          return title.contains(lowerQuery) || cat.contains(lowerQuery);
        }).toList();
      }

      // 3. Filter by Category (Strict)
      if (category != null && category.isNotEmpty && category != "All") {
        filtered = filtered.where((product) {
          return product.category?.name == category;
        }).toList();
      }

      // 4. Filter by Price
      if (minPrice != null) {
        filtered = filtered.where((p) => (p.price ?? 0) >= minPrice).toList();
      }
      if (maxPrice != null) {
        filtered = filtered.where((p) => (p.price ?? 0) <= maxPrice).toList();
      }

      // 5. Sort
      if (sort != null) {
        if (sort == "price_asc") {
          filtered.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
        } else if (sort == "price_desc") {
          filtered.sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
        }
      }

      if (query.isNotEmpty) {
        await _saveToHistory(query);
      }

      return ApiResult.success(SearchResponse(products: filtered));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<void> _saveToHistory(String query) async {
    final history = getSearchHistory();
    if (history.contains(query)) {
      await _historyBox.deleteAt(history.indexOf(query));
    }
    await _historyBox.add(query);

    // Keep only last 10 searches
    if (_historyBox.length > 10) {
      await _historyBox.deleteAt(0);
    }
  }

  List<String> getSearchHistory() {
    return _historyBox.values.toList().reversed.toList();
  }

  Future<void> clearSearchHistory() async {
    await _historyBox.clear();
  }
}
