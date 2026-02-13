import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/models/product_ui_model.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';
import 'package:flux_store/features/products/presentation/cubit/product_details_cubit.dart';
import 'package:flux_store/features/products/presentation/cubit/product_details_state.dart';
import 'package:flux_store/features/search/presentation/widgets/custom_color_and_size.dart';
import 'package:flux_store/features/search/presentation/widgets/product_details/product_description_section.dart';
import 'package:flux_store/features/search/presentation/widgets/product_details/product_images_carousel.dart';
import 'package:flux_store/features/search/presentation/widgets/product_details/product_info_section.dart';
import 'package:flux_store/features/search/presentation/widgets/product_details/product_quantity_selector.dart';
import 'package:flux_store/features/search/presentation/widgets/product_details/product_reviews_section.dart';
import 'package:flux_store/features/search/presentation/widgets/product_details/related_products_list.dart';
import 'package:flux_store/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flux_store/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/core/widgets/custom_snack_bar.dart';
import 'package:flux_store/features/products/data/models/product_response.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final ProductUIModel product;

  const ProductDetailsViewBody({super.key, required this.product});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  int quantity = 1;
  late bool isFavorite;
  Color? selectedColor;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final isLoading = state.status == ProductDetailsStatus.loading;
        final product = state.product;
        final error = state.error;

        if (state.status == ProductDetailsStatus.error && product == null) {
          return Center(child: Text(error ?? s.errorOccurred));
        }

        final images = (product?.images != null && product!.images!.isNotEmpty)
            ? product.images!
            : [widget.product.image];

        return Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 96.h),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Images
                    BlocBuilder<WishlistCubit, WishlistState>(
                      builder: (context, state) {
                        final bool currentIsFavorite =
                            state.wishlistResponse?.data?.any(
                              (item) => item.id == widget.product.id,
                            ) ??
                            isFavorite;
                        return ProductImagesCarousel(
                          images: images,
                          isFavorite: currentIsFavorite,
                          onFavoritePressed: () {
                            context.read<WishlistCubit>().toggleWishlist(
                              widget.product.id,
                              currentIsFavorite,
                              product: ProductModel(
                                id: widget.product.id,
                                title: widget.product.title,
                                imageCover: widget.product.image,
                                price: widget.product.price.toInt(),
                              ),
                            );
                            setState(() => isFavorite = !currentIsFavorite);
                          },
                          onBackDatePressed: () => context.pop(),
                        );
                      },
                    ),
                    vGap(12.h),

                    /// Info (Title, Category, Price)
                    ProductInfoSection(
                      name: product?.title ?? widget.product.title,
                      category: product?.category?.name ?? s.clothing,
                      price: (product?.price ?? widget.product.price)
                          .toDouble(),
                    ),
                    vGap(12.h),

                    /// Quantity
                    ProductQuantitySelector(
                      quantity: quantity,
                      onChanged: (val) => setState(() => quantity = val),
                      availableStock: product?.quantity,
                    ),

                    vGap(12.h),

                    CustomColorAndSize(
                      onColorSelected: (color) => selectedColor = color,
                      onSizeSelected: (size) => selectedSize = size,
                    ),
                    vGap(12.h),

                    /// Description
                    if (isLoading && product?.description == null)
                      Shimmer.fromColors(
                        baseColor: AppColors.grey,
                        highlightColor: AppColors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: Container(
                                width: double.infinity,
                                height: 14.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    else
                      ProductDescriptionSection(
                        description:
                            product?.description ??
                            widget.product.description ??
                            s.noDescription,
                      ),

                    const Divider(),

                    vGap(16.h),
                    // Ratings summary
                    Text(s.reviews, style: AppTextStyles.font16BlackBold),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _ratingBarRow(5, 0.8),
                              _ratingBarRow(4, 0.6),
                              _ratingBarRow(3, 0.3),
                              _ratingBarRow(2, 0.1),
                              _ratingBarRow(1, 0.05),
                            ],
                          ),
                        ),
                        hGap(12.w),
                        Column(
                          children: [
                            Text(
                              product?.ratingsAverage?.toString() ??
                                  widget.product.rating?.toString() ??
                                  '0.0',
                              style: AppTextStyles.font24BlackBold,
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: List.generate(
                                5,
                                (i) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            vGap(4.h),
                            Text(
                              '${product?.ratingsQuantity ?? widget.product.reviewsCount ?? 0} ${s.ratings}',
                              style: AppTextStyles.font14GreyRegular,
                            ),
                          ],
                        ),
                      ],
                    ),

                    vGap(16.h),

                    /// Add Review
                    ProductReviewsSection(productId: widget.product.id),

                    vGap(24.h),

                    /// Related Products (Dynamic)
                    if (isLoading && state.relatedProducts.isEmpty)
                      const ProductSectionShimmer()
                    else
                      RelatedProductsList(products: state.relatedProducts),
                  ],
                ),
              ),
            ),

            /// Add to cart
            Positioned(
              left: AppConstants.paddingHorizontal,
              right: AppConstants.paddingHorizontal,
              bottom: 16.h,
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.primary),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (product?.quantity == 0) {
                      CustomSnackBar.show(
                        context,
                        message: 'Product is out of stock',
                        icon: Icons.error_outline,
                        backgroundColor: AppColors.error,
                        hasBottomNav: true,
                      );
                      return;
                    }
                    if (selectedColor == null || selectedSize == null) {
                      CustomSnackBar.show(
                        context,
                        message: selectedColor == null
                            ? 'Please select a color'
                            : 'Please select a size',
                        icon: Icons.warning_amber_rounded,
                        backgroundColor: AppColors.error,
                        hasBottomNav: true,
                      );
                      return;
                    }
                    context.read<CartCubit>().addToCart(
                      widget.product.id,
                      quantity: quantity,
                    );
                    CustomSnackBar.show(
                      context,
                      message:
                          '${quantity}x ${widget.product.title} added to cart',
                      icon: Icons.check_circle_outline,
                      backgroundColor: AppColors.success,
                      hasBottomNav: true,
                    );
                  },
                  child: Text(
                    s.addToCart,
                    style: AppTextStyles.font14WhiteBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _ratingBarRow(int stars, double ratio) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Text('$stars'),
          hGap(8.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 10.h,
                color: AppColors.primary,
                backgroundColor: AppColors.greyLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
