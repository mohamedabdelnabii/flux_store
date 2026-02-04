import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_decorations.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const ProfileOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: AppDecorations.roundedShadow(
          borderRadius: 12.r,
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: isDestructive
                    ? AppColors.error.withValues(alpha: 0.1)
                    : AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: isDestructive ? AppColors.error : AppColors.primary,
                size: 20.sp,
              ),
            ),
            hGap(16.w),
            Expanded(
              child: Text(
                title,
                style: isDestructive
                    ? AppTextStyles.font16PrimaryBold.copyWith(
                        color: AppColors.error,
                      )
                    : AppTextStyles.font16BlackBold,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
