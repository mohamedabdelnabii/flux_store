import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: const CartItemShimmer(),
              );
            },
          ),
          vGap(24.h),
          const CartSummaryShimmer(),
        ],
      ),
    );
  }
}

class CartItemShimmer extends StatelessWidget {
  const CartItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          hGap(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.h,
                  color: AppColors.grey,
                ),
                vGap(8.h),
                Container(width: 100.w, height: 14.h, color: AppColors.grey),
                vGap(8.h),
                Container(width: 60.w, height: 16.h, color: AppColors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartSummaryShimmer extends StatelessWidget {
  const CartSummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      child: Column(
        children: [
          vGap(16.h),
          Container(width: double.infinity, height: 1.h, color: AppColors.grey),
          vGap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 80.w, height: 16.h, color: AppColors.grey),
              Container(width: 60.w, height: 16.h, color: AppColors.grey),
            ],
          ),
          vGap(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 80.w, height: 16.h, color: AppColors.grey),
              Container(width: 60.w, height: 16.h, color: AppColors.grey),
            ],
          ),
          vGap(24.h),
          Container(
            width: double.infinity,
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ],
      ),
    );
  }
}
