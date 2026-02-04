import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import '../helpers/font_weight_helper.dart';
import 'app_colors.dart';

class ChangaTextStyle extends TextStyle {
  const ChangaTextStyle({
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.color,
    super.letterSpacing,
    super.height,
    super.decoration,
  }) : super(fontFamily: AppConstants.fontFamily);
}

class AppTextStyles {
  const AppTextStyles._();

  // Headings
  static TextStyle font24BlackBold = ChangaTextStyle(
    fontSize: 24.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font20BlackBold = ChangaTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font18BlackBold = ChangaTextStyle(
    fontSize: 18.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );

  // Body / Regular
  static TextStyle font16BlackMedium = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14BlackMedium = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14BlackRegular = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font12BlackMedium = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
  );

  // Primary Colored Styles
  static TextStyle font18PrimaryBold = ChangaTextStyle(
    fontSize: 18.sp,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16PrimaryBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14PrimaryBold = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14PrimaryMedium = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.medium,
  );

  // Grey / Subtle Styles
  static TextStyle font16GreyMedium = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.greyDark,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14GreyMedium = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.grey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14GreyRegular = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.grey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font12GreyRegular = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.grey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font12GreyMedium = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.grey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16GraySemiBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.grey,
    fontWeight: FontWeightHelper.semiBold,
  );

  // White Styles
  static TextStyle font20WhiteSemiBold = ChangaTextStyle(
    fontSize: 20.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16WhiteSemiBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14WhiteBold = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16WhiteBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12WhiteBold = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font20WhiteBold = ChangaTextStyle(
    fontSize: 20.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12PrimaryBold = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.bold,
  );

  // Status Styles
  static TextStyle font14ErrorMedium = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.error,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14SuccessBold = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.success,
    fontWeight: FontWeightHelper.bold,
  );

  // Legacy / Compatibility (to be phased out if possible)
  static TextStyle font16BlackBold = ChangaTextStyle(
    fontSize: 16.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14BlackBold = ChangaTextStyle(
    fontSize: 14.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12BlackBold = ChangaTextStyle(
    fontSize: 12.sp,
    color: AppColors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font24WhiteBold = ChangaTextStyle(
    fontSize: 24.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font18WhiteBold = ChangaTextStyle(
    fontSize: 18.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12GrayRegular = font12GreyRegular;
  static TextStyle font12GrayMedium = font12GreyMedium;
  static TextStyle font16GrayMedium = font16GreyMedium;
  static TextStyle font14GrayMedium = font14GreyMedium;
}
