import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/search/data/models/search_response.dart';
import 'package:flux_store/features/search/data/repos/search_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  Timer? _debounce;

  SearchCubit(this._searchRepo) : super(const SearchState.initial());

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      // Preserve current filters if any
      final currentState = state.maybeWhen(
        success: (_, __, c, min, max, s) => (c: c, min: min, max: max, s: s),
        loading: (_, c, min, max, s) => (c: c, min: min, max: max, s: s),
        orElse: () => (c: null, min: null, max: null, s: null),
      );

      search(
        query: query,
        category: currentState.c,
        minPrice: currentState.min,
        maxPrice: currentState.max,
        sort: currentState.s,
      );
    });
  }

  Future<void> search({
    String query = "",
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sort,
  }) async {
    emit(
      SearchState.loading(
        query: query,
        category: category,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sort: sort,
      ),
    );

    final response = await _searchRepo.search(
      query,
      category: category,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sort: sort,
    );

    response.when(
      success: (searchResponse) {
        emit(
          SearchState.success(
            searchResponse,
            query: query,
            category: category,
            minPrice: minPrice,
            maxPrice: maxPrice,
            sort: sort,
          ),
        );
      },
      failure: (error) {
        emit(SearchState.error(error: error.message ?? ""));
      },
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
