import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/generated/l10n.dart';

class CustomBackAndSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomBackAndSearchAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: AppColors.transparent,
        child: Row(
          children: [
            IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(
                Icons.arrow_back,
                size: 24.sp,
                color: AppColors.primary,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            hGap(12.w),
            Expanded(child: _SearchBox()),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push(SearchView.routeName);
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 20,
              color: AppColors.primary,
            ), // Replace with AppColors.primary if defined
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Text(
                  S
                      .of(context)
                      .search, // Replace with S.of(context).search if localization is enabled
                  style: AppTextStyles.font16GrayMedium.copyWith(
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
