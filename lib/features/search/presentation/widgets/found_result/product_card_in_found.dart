import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_decorations.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/strikethrough_price_custom.dart';
import '../../../../../core/widgets/price_and_logo.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_network_image.dart';

class ProductModelSearch {
  final String id;
  final String name;
  final String image;
  final double price;
  final double? originalPrice;
  final double rating;
  final String? discountPercentage;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoritePressed;
  final VoidCallback onAddToCart;

  ProductModelSearch({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.originalPrice,
    required this.rating,
    this.discountPercentage,
    this.isFavorite = false,
    required this.onTap,
    required this.onFavoritePressed,
    required this.onAddToCart,
  });
}

class ProductCardInFound extends StatefulWidget {
  final ProductModelSearch product;

  const ProductCardInFound({super.key, required this.product});

  @override
  State<ProductCardInFound> createState() => _ProductCardInFoundState();
}

class _ProductCardInFoundState extends State<ProductCardInFound> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.product.onTap,
      child: Container(
        decoration: AppDecorations.roundedShadow(
          borderRadius: 12.r,
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with discount and favorite
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  // Product Image
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.r),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.r),
                      ),
                      child: CustomNetworkImage(
                        imageUrl: widget.product.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Discount Badge
                  if (widget.product.discountPercentage != null)
                    Positioned(
                      top: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          widget.product.discountPercentage!,
                          style: AppTextStyles.font12WhiteBold.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  // Favorite Button
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: () {
                          setState(() => isFavorite = !isFavorite);
                          widget.product.onFavoritePressed();
                        },
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: AppColors.error,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Product Details
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      widget.product.name,
                      style: AppTextStyles.font14BlackMedium.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    vGap(4.h),
                    // Rating
                    Row(
                      children: [
                        Text(
                          widget.product.rating.toString(),
                          style: AppTextStyles.font12GreyMedium.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.greyDark,
                          ),
                        ),
                        hGap(4.w),
                        Icon(Icons.star, color: Colors.amber, size: 14.sp),
                      ],
                    ),
                    const Spacer(flex: 3),
                    // Price and Add to Cart
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              // Current Price
                              PriceAndLogo(
                                price: widget.product.price,
                                size: 16.sp,
                                color: AppColors.primary,
                              ),
                              hGap(2.w),
                              if (widget.product.originalPrice != null)
                                StrikethroughPriceCustom(
                                  price: widget.product.originalPrice!,
                                  size: 12,
                                  strikeColor: AppColors.grey,
                                ),
                            ],
                          ),
                        ),
                        // Add to Cart Button
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().addToCart(
                              widget.product.id,
                            );
                            CustomSnackBar.show(
                              context,
                              message: '${widget.product.name} added to cart',
                              icon: Icons.check_circle_outline,
                              backgroundColor: AppColors.success,
                              duration: const Duration(seconds: 1),
                              hasBottomNav: true,
                            );
                          },
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: AppColors.primary,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
