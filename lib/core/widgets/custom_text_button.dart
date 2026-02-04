import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart' show AppTextStyles;

class CustomTextButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback onTap;
  final Widget? child;
  final TextStyle? style;
  final double? fontSize;
  final bool primary;
  final bool isLoading;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.child,
    this.width,
    this.fontSize,
    this.primary = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: SizedBox(
        width: width?.w ?? double.infinity,
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: primary ? AppColors.primary : AppColors.secondary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                  color: AppColors.black.withValues(alpha: 0.1),
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
              child: isLoading
                  ? SizedBox(
                      width: 20.sp,
                      height: 20.sp,
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                        strokeWidth: 3.r,
                      ),
                    )
                  : child ??
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            text,
                            maxLines: 1,
                            style: AppTextStyles.font16WhiteSemiBold.copyWith(
                              fontSize: fontSize?.sp,
                            ),
                          ),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
