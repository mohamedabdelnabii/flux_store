import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';
import 'package:flux_store/features/search/presentation/widgets/found_result/product_card_in_found.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/features/search/presentation/screens/product_details_view.dart';
import 'package:flux_store/core/models/product_ui_model.dart';

class RelatedProductsList extends StatelessWidget {
  final List<ProductModel> products;

  const RelatedProductsList({super.key, this.products = const []});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You might also like", style: AppTextStyles.font18BlackBold),
        vGap(16.h),
        SizedBox(
          height: 280.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => hGap(12.w),
            itemBuilder: (_, index) {
              final product = products[index];
              return SizedBox(
                width: 160.w,
                child: ProductCardInFound(
                  product: ProductModelSearch(
                    id: product.id ?? "",
                    name: product.title ?? "",
                    image: product.imageCover ?? "",
                    price: (product.price ?? 0).toDouble(),
                    rating: (product.ratingsAverage ?? 0.0).toDouble(),
                    onTap: () {
                      context.push(
                        ProductDetailsView.routeName,
                        extra: ProductUIModel(
                          id: product.id ?? "",
                          title: product.title ?? "",
                          image: product.imageCover ?? "",
                          price: (product.price ?? 0).toDouble(),
                          description: product.description,
                          rating: (product.ratingsAverage ?? 0.0).toDouble(),
                          reviewsCount: product.ratingsQuantity,
                        ),
                      );
                    },
                    onFavoritePressed: () {},
                    onAddToCart: () {},
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
