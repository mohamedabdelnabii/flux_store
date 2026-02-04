import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/auth/data/models/forgot_password_request_body.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../screens/verification_forgot_password.dart';

import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

class GetEmailViewBody extends StatefulWidget {
  const GetEmailViewBody({super.key});

  @override
  State<GetEmailViewBody> createState() => _GetEmailViewBodyState();
}

class _GetEmailViewBodyState extends State<GetEmailViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
            context.push(
              VerificationForgotPasswordView.routeName,
              extra: _emailController.text,
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
                s.forgotPassword,
                style: AppTextStyles.font24BlackBold.copyWith(
                  fontSize: 30.sp,
                  height: 1.2,
                ),
              ),
              vGap(20.h),
              // Description
              Text(
                s.emailHint,
                style: AppTextStyles.font14GrayMedium.copyWith(
                  color: AppColors.black.withValues(alpha: 0.7),
                ),
              ),
              vGap(50.h),
              // Field
              CustomTextFormField(
                controller: _emailController,
                hintText: "Email address",
                textInputType: TextInputType.emailAddress,
                validator: (val) =>
                    val == null || val.isEmpty ? s.requiredField : null,
              ),
              vGap(40.h),
              // Send Code Button
              Center(
                child: CustomTextButton(
                  width: 160.w,
                  text: s.sendCode,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().forgotPassword(
                        ForgotPasswordRequestBody(email: _emailController.text),
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
