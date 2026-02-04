import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/helpers/app_assets.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/auth/presentation/screens/Login_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flux_store/features/auth/data/models/signup_request_body.dart';
import 'package:flux_store/features/home/presentation/screens/bottom_nav_bar_view.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';

import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
          success: (authResponse) async {
            context.pop(); // Close loading dialog
            if (authResponse.token != null) {
              await SharedPrefHelper.setSecuredString(
                AppConstants.prefsAccessToken,
                authResponse.token!,
              );
              if (context.mounted) {
                GoRouter.of(
                  context,
                ).pushReplacement(BottomNavBarView.routeName);
              }
            }
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
          child: SingleChildScrollView(
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
                Center(
                  child: Image.asset(height: 150.h, Assets.imagesPngAppIcon),
                ),
                vGap(10.h),
                // Title
                Text(
                  s.createNewAccount,
                  style: AppTextStyles.font24BlackBold.copyWith(
                    fontSize: 30.sp,
                    height: 1.2,
                  ),
                ),
                vGap(30.h),
                // Fields
                CustomTextFormField(
                  controller: nameController,
                  hintText: s.name,
                  textInputType: TextInputType.name,
                  validator: (val) =>
                      val == null || val.isEmpty ? s.requiredField : null,
                ),
                vGap(15.h),
                CustomTextFormField(
                  controller: emailController,
                  hintText: s.email,
                  textInputType: TextInputType.emailAddress,
                  validator: (val) =>
                      val == null || val.isEmpty ? s.requiredField : null,
                ),
                vGap(15.h),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: s.password,
                  textInputType: TextInputType.visiblePassword,
                  isObscureText: true,
                  validator: (val) =>
                      val == null || val.isEmpty ? s.requiredField : null,
                ),
                vGap(15.h),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: s.confirmPassword,
                  textInputType: TextInputType.visiblePassword,
                  isObscureText: true,
                  validator: (val) {
                    if (val == null || val.isEmpty) return s.requiredField;
                    if (val != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                vGap(30.h),
                // Sign Up Button
                Center(
                  child: CustomTextButton(
                    width: 150.w,
                    text: s.sign_up,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().signup(
                          SignupRequestBody(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            rePassword: confirmPasswordController.text,
                            phone: "01012345678",
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
                vGap(30.h),
                // Social Login Section
                Center(
                  child: Text(
                    s.signUpWith,
                    style: AppTextStyles.font14GrayMedium,
                  ),
                ),
                vGap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialCircleButton(
                      icon: FontAwesomeIcons.google,
                      color: AppColors.error,
                      onTap: () {},
                    ),
                    hGap(20.w),
                    _SocialCircleButton(
                      icon: FontAwesomeIcons.facebook,
                      color: AppColors.primary,
                      onTap: () {},
                    ),
                    hGap(20.w),
                    _SocialCircleButton(
                      icon: FontAwesomeIcons.apple,
                      color: AppColors.black,
                      onTap: () {},
                    ),
                  ],
                ),
                vGap(20.h),
                // Bottom Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        s.alreadyHaveAccount,
                        style: AppTextStyles.font14GrayMedium.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.pushReplacement(LoginView.routeName),
                        child: Text(
                          s.login,
                          style: AppTextStyles.font14BlackBold.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                vGap(30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialCircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SocialCircleButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey.withValues(alpha: 0.3)),
          color: AppColors.white,
        ),
        child: Icon(icon, color: color, size: 20.sp),
      ),
    );
  }
}
