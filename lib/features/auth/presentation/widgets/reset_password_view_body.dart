import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/core/widgets/custom_text_form_field.dart';
import 'package:flux_store/features/auth/presentation/screens/auth_success_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flux_store/features/auth/data/models/reset_password_request_body.dart';
import 'package:go_router/go_router.dart';

import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({
    super.key,
    required this.email,
    required this.resetToken,
  });

  final String email;
  final String resetToken;

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
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
            context.push(AuthSuccessView.routeName);
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
          autovalidateMode: autovalidateMode,
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
                "Create New Password",
                style: AppTextStyles.font24BlackBold.copyWith(
                  fontSize: 30.sp,
                  height: 1.2,
                ),
              ),
              vGap(20.h),
              // Description
              Text(
                "Your new password must be different from previously used password.",
                style: AppTextStyles.font14GrayMedium.copyWith(
                  color: AppColors.black.withValues(alpha: 0.7),
                ),
              ),
              vGap(50.h),
              // Fields
              CustomTextFormField(
                controller: passwordController,
                hintText: "New Password",
                textInputType: TextInputType.visiblePassword,
                isObscureText: true,
                validator: (val) =>
                    val == null || val.isEmpty ? s.requiredField : null,
              ),
              vGap(20.h),
              CustomTextFormField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                textInputType: TextInputType.visiblePassword,
                isObscureText: true,
                validator: (val) {
                  if (val == null || val.isEmpty) return s.requiredField;
                  if (val != passwordController.text) return s.passwordMismatch;
                  return null;
                },
              ),
              vGap(40.h),
              // Confirm Button
              Center(
                child: CustomTextButton(
                  width: 150.w,
                  text: "CONFIRM",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().resetPassword(
                        ResetPasswordRequestBody(
                          email: widget.email,
                          newPassword: passwordController.text,
                        ),
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
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
