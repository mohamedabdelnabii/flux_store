import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';

class CustomErrorState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? retryButtonText;
  final VoidCallback? onRetry;
  final IconData? icon;

  const CustomErrorState({
    super.key,
    required this.title,
    this.subtitle,
    this.retryButtonText,
    this.onRetry,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon ?? Icons.error_outline, color: AppColors.grey, size: 48.sp),
          vGap(16.h),
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
          if (onRetry != null) ...[
            vGap(16),
            CustomTextButton(text: retryButtonText ?? 'Retry', onTap: onRetry!),
          ],
        ],
      ),
    );
  }
}
