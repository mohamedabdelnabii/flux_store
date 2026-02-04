import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    IconData icon = Icons.info,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    bool hasBottomNav = false,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: hasBottomNav
          ? EdgeInsets.only(bottom: 90.h, left: 16.w, right: 16.w)
          : EdgeInsets.all(16.w),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: duration,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22.r),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.font16BlackMedium.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
