import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_decorations.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/price_and_logo.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';
import 'package:flux_store/core/widgets/custom_network_image.dart';

class CartItemWidget extends StatelessWidget {
  final CartProductItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: AppDecorations.roundedShadow(
        borderRadius: 16.r,
        color: AppColors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Image
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.greyLight,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CustomNetworkImage(
                imageUrl: item.product?.imageCover ?? '',
                fit: BoxFit.cover,
                width: 80.w,
                height: 80.h,
              ),
            ),
          ),
          hGap(16.w),

          // Item Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.product?.title ?? '',
                        style: AppTextStyles.font14BlackBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: onDelete,
                      child: Icon(
                        Icons.close,
                        size: 20.sp,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                vGap(4.h),
                if (item.product?.category != null)
                  Text(
                    item.product?.category?.name ?? '',
                    style: AppTextStyles.font12GreyMedium,
                  ),
                vGap(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceAndLogo(price: (item.price ?? 0).toDouble()),
                    Row(
                      children: [
                        _quantityButton(Icons.remove, onDecrement),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            (item.count ?? 1).toString(),
                            style: AppTextStyles.font14BlackBold,
                          ),
                        ),
                        _quantityButton(Icons.add, onIncrement),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyLight),
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.white,
        ),
        child: Icon(icon, size: 16.sp, color: AppColors.greyDark),
      ),
    );
  }
}
