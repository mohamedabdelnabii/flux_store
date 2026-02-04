import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/widgets/custom_text_row.dart';
import 'package:flux_store/features/home/presentation/widgets/products/product_card.dart';
import 'package:flux_store/features/products/domain/usecases/get_products_use_case.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/features/search/presentation/screens/search_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class WomensProductsSection extends StatefulWidget {
  final String categoryId;
  const WomensProductsSection({super.key, required this.categoryId});

  @override
  State<WomensProductsSection> createState() => _WomensProductsSectionState();
}

class _WomensProductsSectionState extends State<WomensProductsSection> {
  List<ProductModel> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() => isLoading = true);
    final useCase = getIt<GetProductsUseCase>();
    final result = await useCase(categoryId: widget.categoryId);

    result.when(
      success: (response) {
        if (mounted) {
          setState(() {
            products = response.data ?? [];
            isLoading = false;
          });
        }
      },
      failure: (_) {
        if (mounted) {
          setState(() => isLoading = false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const ProductSectionShimmer(title: "Women's Collection");
    }

    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.paddingHorizontal,
          ),
          child: CustomTextRow(
            title: "Women's Collection",
            subTitle: S.of(context).showAll,
            onTap: () {
              context.read<SearchCubit>().search(category: "Women's Fashion");
              context.push(SearchView.routeName);
            },
          ),
        ),
        vGap(16.h),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.paddingHorizontal,
            ),
            itemCount: products.length > 10 ? 10 : products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: ProductCard(
                  image: product.imageCover ?? '',
                  title: product.title ?? '',
                  price: (product.price ?? 0).toDouble(),
                  id: product.id,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
