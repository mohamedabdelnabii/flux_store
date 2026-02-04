import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/price_and_logo.dart';
import 'package:flux_store/core/widgets/strikethrough_price_custom.dart';

class ProductInfoSection extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final double? originalPrice;
  final String? discountPercentage;

  const ProductInfoSection({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    this.originalPrice,
    this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.font18BlackBold.copyWith(fontSize: 20.sp),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            hGap(8.w),
            Text(category, style: AppTextStyles.font14PrimaryMedium),
          ],
        ),
        vGap(12.h),

        /// Price
        Row(
          children: [
            if (discountPercentage != null) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  discountPercentage!,
                  style: AppTextStyles.font12PrimaryBold.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
              hGap(12.w),
            ],
            PriceAndLogo(price: price),
            if (originalPrice != null) ...[
              hGap(8.w),
              StrikethroughPriceCustom(price: originalPrice!),
            ],
          ],
        ),
      ],
    );
  }
}
