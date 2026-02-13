import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/home/data/models/home_response.dart';
import 'package:flux_store/features/home/data/repos/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState());

  Future<void> getHomeData({bool forceRefresh = false}) async {
    // Load cached data first for instant UI
    if (!forceRefresh) {
      final cachedData = _homeRepo.getCachedHomeData();
      if (cachedData != null) {
        final filteredResponse = _filterHomeData(cachedData);
        if (!isClosed) {
          emit(
            state.copyWith(isLoading: false, homeResponse: filteredResponse),
          );
        }
      }
    }

    // Then fetch fresh data in background
    if (!isClosed) emit(state.copyWith(isLoading: true, error: null));
    final response = await _homeRepo.getHomeData();
    response.when(
      success: (homeResponse) {
        final filteredResponse = _filterHomeData(homeResponse);
        if (!isClosed) {
          emit(
            state.copyWith(isLoading: false, homeResponse: filteredResponse),
          );
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(state.copyWith(isLoading: false, error: error.message ?? ""));
        }
      },
    );
  }

  HomeResponse _filterHomeData(HomeResponse homeResponse) {
    final filteredCategories = homeResponse.categories
        ?.where(
          (element) =>
              element.name == "Men's Fashion" ||
              element.name == "Women's Fashion",
        )
        .toList();

    final filteredProducts = homeResponse.products
        ?.where(
          (product) =>
              product.category?.name == "Men's Fashion" ||
              product.category?.name == "Women's Fashion",
        )
        .toList();

    return HomeResponse(
      categories: filteredCategories,
      products: filteredProducts,
    );
  }

  void selectCategory(String? id, String? name) {
    if (!isClosed) {
      emit(state.copyWith(selectedCategoryId: id, selectedCategoryName: name));
    }
  }
}
