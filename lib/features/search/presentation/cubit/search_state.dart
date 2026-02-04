part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading({
    String? query,
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sort,
  }) = Loading;
  const factory SearchState.success(
    SearchResponse searchResponse, {
    String? query,
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sort,
  }) = Success;
  const factory SearchState.error({required String error}) = Error;
}
