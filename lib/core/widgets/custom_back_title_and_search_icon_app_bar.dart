import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class CustomBackTitleAndSearchIconAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomBackTitleAndSearchIconAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: AppColors.white,
        child: Row(
          children: [
            IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(
                Icons.arrow_back_ios,
                size: 24.sp,
                color: AppColors.primary,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.font18BlackBold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () {
                // GoRouter.of(context).push(SearchView.routeName);
              },
              icon: Icon(Icons.search, size: 24.sp, color: AppColors.primary),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
