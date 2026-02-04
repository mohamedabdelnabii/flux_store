import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/auth/presentation/screens/Login_view.dart';
import 'package:go_router/go_router.dart';

class AuthSuccessViewBody extends StatelessWidget {
  const AuthSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.black.withValues(
        alpha: 0.5,
      ), // Semi-transparent background
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 50.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Success Icon
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.black.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    size: 60.sp,
                    color: AppColors.green,
                  ),
                ),
                vGap(30.h),
                // Title
                Text(
                  "Successful!",
                  style: AppTextStyles.font24BlackBold.copyWith(
                    fontSize: 28.sp,
                  ),
                ),
                vGap(15.h),
                // Subtitle
                Text(
                  "Your password has been changed.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font14GrayMedium.copyWith(
                    color: AppColors.black.withValues(alpha: 0.6),
                  ),
                ),
                vGap(50.h),
                // Button
                CustomTextButton(
                  width: 200.w,
                  text: "BACK TO LOGIN",
                  onTap: () {
                    context.go(LoginView.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
