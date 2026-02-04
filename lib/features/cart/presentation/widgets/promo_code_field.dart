import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_decorations.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/generated/l10n.dart';

class PromoCodeField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onApply;

  const PromoCodeField({
    super.key,
    required this.controller,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      decoration: AppDecorations.roundedShadow(
        borderRadius: 12.r,
        color: AppColors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: s.enterPromoCode,
                hintStyle: AppTextStyles.font14GreyMedium,
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton(
            onPressed: onApply,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(s.apply, style: AppTextStyles.font14PrimaryBold),
          ),
        ],
      ),
    );
  }
}
