import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class VoucherViewBody extends StatelessWidget {
  const VoucherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vGap(20.h),
          // Back Button
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: AppColors.black,
              ),
            ),
          ),
          vGap(30.h),
          Text(
            "Vouchers",
            style: AppTextStyles.font24BlackBold.copyWith(fontSize: 28.sp),
          ),
          vGap(20.h),
          // Search/Input for promo code
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.grey.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter promo code",
                      hintStyle: AppTextStyles.font14GrayMedium,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text("APPLY", style: AppTextStyles.font14WhiteBold),
                  ),
                ),
              ],
            ),
          ),
          vGap(30.h),
          // Available Vouchers text
          Text("Available Vouchers", style: AppTextStyles.font16BlackBold),
          vGap(16.h),
          // Voucher List
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return _VoucherCard(
                  discount: index == 0 ? "50%" : "20%",
                  code: index == 0 ? "FLAT50" : "NEWUSER",
                  validUntil: "12 Dec 2023",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _VoucherCard extends StatelessWidget {
  final String discount;
  final String code;
  final String validUntil;

  const _VoucherCard({
    required this.discount,
    required this.code,
    required this.validUntil,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Side (Discount)
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Text(
                  discount,
                  style: AppTextStyles.font24BlackBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text("OFF", style: AppTextStyles.font12PrimaryBold),
              ],
            ),
          ),
          hGap(20.w),
          // Middle Side (Details)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Promo Code: $code", style: AppTextStyles.font16BlackBold),
                vGap(4.h),
                Text(
                  "Valid until $validUntil",
                  style: AppTextStyles.font14GrayMedium,
                ),
              ],
            ),
          ),
          // Right Side (Action)
          GestureDetector(
            onTap: () {},
            child: Text("USE", style: AppTextStyles.font14PrimaryBold),
          ),
        ],
      ),
    );
  }
}
