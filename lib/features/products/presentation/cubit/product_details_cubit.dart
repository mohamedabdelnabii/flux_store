import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/products/domain/usecases/get_product_details_use_case.dart';
import 'package:flux_store/features/products/domain/usecases/get_products_use_case.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  final GetProductsUseCase _getProductsUseCase;

  ProductDetailsCubit(this._getProductDetailsUseCase, this._getProductsUseCase)
    : super(ProductDetailsState());

  Future<void> getProductDetails(String id) async {
    emit(state.copyWith(status: ProductDetailsStatus.loading));

    final result = await _getProductDetailsUseCase(id);

    result.when(
      success: (product) async {
        // Fetch related products based on category
        List<ProductModel> related = [];
        if (product.category?.id != null) {
          final relatedResult = await _getProductsUseCase(
            categoryId: product.category!.id!,
          );
          relatedResult.when(
            success: (response) {
              related = response.data ?? [];
            },
            failure: (_) {},
          );
        }

        emit(
          state.copyWith(
            status: ProductDetailsStatus.success,
            product: product,
            relatedProducts: related,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: ProductDetailsStatus.error,
            error: error.message ?? "Failed to load product details",
          ),
        );
      },
    );
  }
}
