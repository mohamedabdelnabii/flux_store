part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    HomeResponse? homeResponse,
    String? error,
    String? selectedCategoryId,
    String? selectedCategoryName,
  }) = _HomeState;
}
