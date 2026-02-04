import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class OrderTrackingViewBody extends StatelessWidget {
  const OrderTrackingViewBody({super.key});

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
            "Track Order",
            style: AppTextStyles.font24BlackBold.copyWith(fontSize: 28.sp),
          ),
          vGap(30.h),
          // Order Summary Card
          Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order ID: #1947034",
                      style: AppTextStyles.font16BlackBold,
                    ),
                    vGap(4.h),
                    Text(
                      "Date: 05/12/2023",
                      style: AppTextStyles.font14GrayMedium,
                    ),
                  ],
                ),
                Text("\$112.00", style: AppTextStyles.font18PrimaryBold),
              ],
            ),
          ),
          vGap(40.h),
          // Stepper
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView(
                children: [
                  _TrackingStep(
                    title: "Processed",
                    time: "05/12/2023, 10:30 AM",
                    isCompleted: true,
                    isLast: false,
                  ),
                  _TrackingStep(
                    title: "Shipped",
                    time: "05/12/2023, 12:45 PM",
                    isCompleted: true,
                    isLast: false,
                  ),
                  _TrackingStep(
                    title: "In Hand",
                    time: "06/12/2023, 09:15 AM",
                    isCompleted: true,
                    isLast: false,
                  ),
                  _TrackingStep(
                    title: "At Your Door",
                    time: "Expected by 08/12/2023",
                    isCompleted: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackingStep extends StatelessWidget {
  final String title;
  final String time;
  final bool isCompleted;
  final bool isLast;

  const _TrackingStep({
    required this.title,
    required this.time,
    required this.isCompleted,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? AppColors.black : AppColors.white,
                border: Border.all(
                  color: isCompleted ? AppColors.black : AppColors.grey,
                  width: 2,
                ),
              ),
              child: isCompleted
                  ? Icon(Icons.check, size: 14.sp, color: AppColors.white)
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2.w,
                height: 60.h,
                color: isCompleted
                    ? AppColors.black
                    : AppColors.grey.withValues(alpha: 0.3),
              ),
          ],
        ),
        hGap(20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.font16BlackBold.copyWith(
                  color: isCompleted ? AppColors.black : AppColors.grey,
                ),
              ),
              vGap(4.h),
              Text(
                time,
                style: AppTextStyles.font14GrayMedium.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
