import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/widgets/custom_text_row.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/home/presentation/widgets/products/product_card.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/features/search/presentation/screens/search_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class FeatureProductsSection extends StatelessWidget {
  final List<ProductModel> products;
  const FeatureProductsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    final s = S.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.paddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextRow(
              title: s.featureProducts,
              subTitle: s.showAll,
              onTap: () {
                context.read<SearchCubit>().search(); // Empty search for all
                context.push(SearchView.routeName);
              },
            ),
            vGap(20.h),
            SizedBox(
              height: 280.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  return ProductCard(
                    image: item.imageCover ?? '',
                    title: item.title ?? '',
                    price: (item.price ?? 0).toDouble(),
                    id: item.id,
                  );
                },
                separatorBuilder: (context, index) => hGap(20.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
