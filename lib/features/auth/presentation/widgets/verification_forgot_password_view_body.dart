import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/auth/data/models/verify_reset_code_request_body.dart';
import 'package:flux_store/features/auth/presentation/widgets/verification_code_input_filed.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/helpers/spacing.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/reset_password_view.dart';

import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

class VerificationForgotPasswordViewBody extends StatefulWidget {
  const VerificationForgotPasswordViewBody({super.key, required this.email});

  final String email;

  @override
  State<VerificationForgotPasswordViewBody> createState() =>
      _VerificationForgotPasswordViewBodyState();
}

class _VerificationForgotPasswordViewBodyState
    extends State<VerificationForgotPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: GenericCircularShimmer()),
            );
          },
          success: (authResponse) {
            context.pop(); // Close loading dialog
            context.push(
              ResetPasswordView.routeName,
              extra: {'email': widget.email, 'resetToken': otp},
            );
          },
          error: (error) {
            context.pop(); // Close loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error), backgroundColor: AppColors.error),
            );
          },
        );
      },
      child: Padding(
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
                length: 6,
                onCompleted: (code) {
                  otp = code;
                },
              ),
              vGap(50.h),
              // Verify Button
              Center(
                child: CustomTextButton(
                  width: 160.w,
                  text: "VERIFY",
                  onTap: () {
                    if (otp.length == 6) {
                      context.read<AuthCubit>().verifyResetCode(
                        VerifyResetCodeRequestBody(resetCode: otp),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter 6-digit code"),
                          backgroundColor: AppColors.error,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
