import 'package:flutter/material.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class CustomTextRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onTap;
  const CustomTextRow({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.font16PrimaryBold),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTitle,
            style: AppTextStyles.font14BlackBold.copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
