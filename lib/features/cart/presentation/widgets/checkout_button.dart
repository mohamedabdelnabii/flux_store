import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/generated/l10n.dart';

class CheckoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const CheckoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          elevation: 2,
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              s.checkout,
              style: AppTextStyles.font14WhiteBold.copyWith(fontSize: 16.sp),
            ),
            hGap(8.w),
            Icon(Icons.arrow_forward, color: Colors.white, size: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget hGap(double width) => SizedBox(width: width);
}
