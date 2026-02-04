import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/home/data/models/home_response.dart';
import 'package:flux_store/features/home/data/repos/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  Future<void> getHomeData() async {
    if (!isClosed) emit(const HomeState.loading());
    final response = await _homeRepo.getHomeData();
    response.when(
      success: (homeResponse) {
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

        final filteredResponse = HomeResponse(
          categories: filteredCategories,
          products: filteredProducts,
        );
        if (!isClosed) emit(HomeState.success(filteredResponse));
      },
      failure: (error) {
        if (!isClosed) emit(HomeState.error(error: error.message ?? ""));
      },
    );
  }
}
