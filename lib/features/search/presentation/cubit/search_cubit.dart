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

  SearchCubit(this._searchRepo) : super(const SearchState());

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      search(
        query: query,
        category: state.category,
        minPrice: state.minPrice,
        maxPrice: state.maxPrice,
        sort: state.sort,
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
      state.copyWith(
        isLoading: true,
        query: query,
        category: category,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sort: sort,
        error: null,
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
        emit(state.copyWith(isLoading: false, searchResponse: searchResponse));
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error.message ?? ""));
      },
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
