import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/features/auth/presentation/widgets/verification_code_input_filed.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/helpers/spacing.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key, required this.userId});
  final int userId;

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vGap(20.h),
            // Back Button
            GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            vGap(30.h),
            // Title
            Text(
              "Verification",
              style: AppTextStyles.font24BlackBold.copyWith(
                fontSize: 30.sp,
                height: 1.2,
              ),
            ),
            vGap(20.h),
            // Description
            Text(
              "Please enter the verification code we sent to your email address.",
              style: AppTextStyles.font14GrayMedium.copyWith(
                color: AppColors.black.withValues(alpha: 0.7),
              ),
            ),
            vGap(50.h),
            // Input Field
            VerificationCodeInputField(
              length: 4,
              onCompleted: (code) {
                otp = code;
              },
            ),
            vGap(50.h),
            // Verify Button
            Center(
              child: _BlackPillButton(
                text: "VERIFY",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // Navigate to Home or Success
                    // context.go(HomeView.routeName);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlackPillButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _BlackPillButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.font16WhiteBold.copyWith(letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
