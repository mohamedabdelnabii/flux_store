import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class CustomEmptyState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? actionWidget;

  const CustomEmptyState({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon ?? Icons.info_outline, color: AppColors.primary, size: 48.sp),
          vGap(16),
          Text(
            title,
            style: AppTextStyles.font16GreyMedium,
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            vGap(8),
            Text(
              subtitle!,
              style: AppTextStyles.font14GreyMedium,
              textAlign: TextAlign.center,
            ),
          ],
          if (actionWidget != null) ...[vGap(16), actionWidget!],
        ],
      ),
    );
  }
}
