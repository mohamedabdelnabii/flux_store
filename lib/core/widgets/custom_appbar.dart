import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/localizationa.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final Widget? icon;
  final VoidCallback? onTap;
  final Widget? text;
  final double height;
  final String? fallbackRoute;

  const CustomAppbar({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.subTitle,
    this.text,
    this.height = kToolbarHeight,
    this.fallbackRoute,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: height + 20.h,
      leadingWidth: 56.w,
      leading: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else if (fallbackRoute != null) {
              context.go(fallbackRoute!);
            } else {}
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
            size: 20.sp,
          ),
        ),
      ),
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                maxLines: 1,
                style: AppTextStyles.font24BlackBold.copyWith(
                  color: AppColors.primary,
                  fontSize: 22.sp,
                ),
              ),
              if (subTitle != null)
                Text(
                  subTitle!,
                  maxLines: 1,
                  style: AppTextStyles.font14PrimaryMedium,
                ),
              if (text != null) text!,
            ],
          ),
        ),
      ),
      actions: [
        if (icon != null)
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.only(
                  left: isArabicLocale(context) ? 16.h : 0,
                  right: isArabicLocale(context) ? 0 : 16.h,
                ),
                child: icon,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height + 20.h);
}
