import 'package:flux_store/features/products/data/models/product_response.dart';

class ProductDetailsState {
  final ProductDetailsStatus status;
  final ProductModel? product;
  final List<ProductModel> relatedProducts;
  final String? error;

  ProductDetailsState({
    this.status = ProductDetailsStatus.initial,
    this.product,
    this.relatedProducts = const [],
    this.error,
  });

  ProductDetailsState copyWith({
    ProductDetailsStatus? status,
    ProductModel? product,
    List<ProductModel>? relatedProducts,
    String? error,
  }) {
    return ProductDetailsState(
      status: status ?? this.status,
      product: product ?? this.product,
      relatedProducts: relatedProducts ?? this.relatedProducts,
      error: error ?? this.error,
    );
  }
}

enum ProductDetailsStatus { initial, loading, success, error }
