import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_network_image.dart';
import 'package:flux_store/core/models/product_ui_model.dart';
import 'package:flux_store/features/search/presentation/screens/product_details_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/core/widgets/price_and_logo.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flux_store/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flux_store/features/wishlist/presentation/cubit/wishlist_state.dart';

import 'package:flux_store/core/widgets/custom_snack_bar.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final String? id;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (id != null) {
          context.push(
            ProductDetailsView.routeName,
            extra: ProductUIModel(
              id: id!,
              title: title,
              image: image,
              price: price,
            ),
          );
        }
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 160.w,
                height: 170.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.greyLight,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CustomNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    width: 160.w,
                    height: 170.h,
                  ),
                ),
              ),
              // Favorite Button
              if (id != null)
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: BlocBuilder<WishlistCubit, WishlistState>(
                    builder: (context, state) {
                      final bool isFavorite = state.maybeWhen(
                        success: (wishlist) =>
                            wishlist.data?.any((item) => item.id == id) ??
                            false,
                        orElse: () => false,
                      );
                      return GestureDetector(
                        onTap: () {
                          context.read<WishlistCubit>().toggleWishlist(
                            id!,
                            isFavorite,
                          );
                        },
                        child: CircleAvatar(
                          radius: 16.r,
                          backgroundColor: AppColors.white.withValues(
                            alpha: 0.8,
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : AppColors.black,
                            size: 20.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
          vGap(8.h),
          SizedBox(
            width: 160.w,
            child: Text(
              title,
              style: AppTextStyles.font14BlackBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          vGap(6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PriceAndLogo(price: price),
              if (id != null) ...[
                hGap(10.w),
                GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().addToCart(id!);
                    CustomSnackBar.show(
                      context,
                      message: "Added to cart",
                      icon: Icons.check_circle_outline,
                      backgroundColor: AppColors.success,
                      hasBottomNav: true,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.add, color: AppColors.white, size: 18.sp),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
