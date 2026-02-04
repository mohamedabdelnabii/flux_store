import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/core/models/product_ui_model.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/products/presentation/cubit/product_details_cubit.dart';
import 'package:flux_store/features/products/presentation/cubit/reviews_cubit.dart';
import 'package:flux_store/features/search/presentation/widgets/found_result/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = '/product-details';
  final ProductUIModel product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ProductDetailsCubit>()..getProductDetails(product.id),
        ),
        BlocProvider(
          create: (context) =>
              getIt<ReviewsCubit>()..getProductReviews(product.id),
        ),
      ],
      child: CustomScaffold(body: ProductDetailsViewBody(product: product)),
    );
  }
}
