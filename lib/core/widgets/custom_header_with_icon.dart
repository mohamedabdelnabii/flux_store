import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class CustomHeaderWithIconOrNot extends StatelessWidget {
  final VoidCallback? onTapR;
  final VoidCallback? onTapL;
  final String title;
  final IconData? iconR;
  final IconData? iconL;

  final bool showBadge;
  final int badgeCount;

  const CustomHeaderWithIconOrNot({
    super.key,
    this.onTapR,
    this.onTapL,
    required this.title,
    this.iconR,
    this.iconL,
    this.showBadge = false,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: IconButton(
              icon: Icon(iconR, size: 24.sp, color: AppColors.blackSoft),
              onPressed: onTapR,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.font24BlackBold.copyWith(
              color: AppColors.blackSoft,
            ),
          ),
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: AppColors.greySubtle,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: Icon(iconL, size: 24.sp, color: AppColors.blackSoft),
                  onPressed: onTapL,
                ),
                if (showBadge && badgeCount > 0)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16.w,
                        minHeight: 16.w,
                      ),
                      child: Text(
                        badgeCount > 9 ? '9+' : badgeCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
