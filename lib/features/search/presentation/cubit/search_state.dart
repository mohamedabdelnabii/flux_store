part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    SearchResponse? searchResponse,
    String? query,
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sort,
    String? error,
  }) = _SearchState;
}
