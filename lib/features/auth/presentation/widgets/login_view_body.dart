import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/helpers/app_assets.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/auth/presentation/screens/register_view.dart';
import 'package:flux_store/features/home/presentation/screens/bottom_nav_bar_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flux_store/features/auth/presentation/screens/get_email_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flux_store/features/auth/data/models/login_request_body.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';

import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

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
                Center(
                  child: Image.asset(height: 150.h, Assets.imagesPngAppIcon),
                ),
                vGap(10.h),
                // Title
                Text(
                  s.logInto,
                  style: AppTextStyles.font24BlackBold.copyWith(
                    fontSize: 28.sp,
                    color: AppColors.blackSoft,
                  ),
                ),
                vGap(40.h),
                // Fields
                CustomTextFormField(
                  hintText: s.emailAddress,
                  textInputType: TextInputType.emailAddress,
                  validator: (val) =>
                      val == null || val.isEmpty ? s.requiredField : null,
                  onSaved: (val) => email = val ?? "",
                ),
                vGap(20.h),
                CustomTextFormField(
                  hintText: s.password,
                  textInputType: TextInputType.visiblePassword,
                  isObscureText: true,
                  validator: (val) =>
                      val == null || val.isEmpty ? s.requiredField : null,
                  onSaved: (val) => password = val ?? "",
                ),
                vGap(12.h),
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => context.push(GetEmailView.routeName),
                    child: Text(
                      '${s.forgotPassword}?',
                      style: AppTextStyles.font14GreyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                vGap(30.h),
                // Log In Button
                Center(
                  child: CustomTextButton(
                    width: 200.w,
                    text: s.login,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<AuthCubit>().login(
                          LoginRequestBody(email: email, password: password),
                        );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                ),
                vGap(40.h),
                // Social Login Section
                Center(
                  child: Text(
                    s.logInWith,
                    style: AppTextStyles.font14GreyMedium,
                  ),
                ),
                vGap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialCircleButton(
                      icon: FontAwesomeIcons.google,
                      color: const Color(0xFFDB4437),
                      onTap: () {},
                    ),
                    hGap(24.w),
                    _SocialCircleButton(
                      icon: FontAwesomeIcons.facebook,
                      color: const Color(0xFF4267B2),
                      onTap: () {},
                    ),
                    hGap(24.w),
                    _SocialCircleButton(
                      icon: FontAwesomeIcons.apple,
                      color: AppColors.black,
                      onTap: () {},
                    ),
                  ],
                ),
                vGap(30.h),
                // Bottom Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        s.dontHaveAccount,
                        style: AppTextStyles.font14GreyMedium,
                      ),
                      hGap(4.w),
                      GestureDetector(
                        onTap: () =>
                            context.pushReplacement(RegisterView.routeName),
                        child: Text(
                          s.sign_up,
                          style: AppTextStyles.font14PrimaryBold.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                vGap(40.h),
                // Login as Guest button
                Center(
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(BottomNavBarView.routeName);
                    },
                    child: Text(
                      S.of(context).loginAsGuest,
                      style: AppTextStyles.font14GreyMedium.copyWith(
                        color: AppColors.blackSoft,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
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
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(icon, color: color, size: 22.sp),
      ),
    );
  }
}
