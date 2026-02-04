import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBackAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onPressed,
    this.iconSize = 25,
    this.actions,
  });

  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onPressed;
  final double? iconSize;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: AppColors.background,
        child: Row(
          children: [
            // Back button
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primaryLight,
                size: 20.sp,
              ),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            // Title centered
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.font18BlackBold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Action or Spacer
            if (leadingIcon != null || actions != null) ...[
              if (leadingIcon != null)
                GestureDetector(
                  onTap: () => onPressed?.call(),
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      leadingIcon,
                      size: 20.sp,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ),
              if (actions != null) ...actions!,
            ] else
              hGap(40.w), // Balance the back button
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h); // Includes spacing and SafeArea content
}
