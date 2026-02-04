import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/core/widgets/custom_text_form_field.dart';
import 'package:flux_store/features/auth/data/models/change_password_request_body.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/core/widgets/custom_snack_bar.dart';

import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

class ChangePasswordView extends StatelessWidget {
  static const String routeName = '/change-password';
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: const ChangePasswordViewBody(),
    );
  }
}

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final TextEditingController _currentController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      appBar: CustomBackAppBar(title: "Change Password"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (authResponse) {
                CustomSnackBar.show(
                  context,
                  message: "Password changed successfully",
                  icon: Icons.check_circle_outline,
                  backgroundColor: AppColors.success,
                );
                context.pop();
              },
              error: (error) {
                CustomSnackBar.show(
                  context,
                  message: error,
                  icon: Icons.error_outline,
                  backgroundColor: AppColors.error,
                );
              },
            );
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _currentController,
                    hintText: "Current Password",
                    textInputType: TextInputType.visiblePassword,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return s.requiredField;
                      }
                      return null;
                    },
                    isObscureText: true,
                  ),
                  vGap(16.h),
                  CustomTextFormField(
                    controller: _newController,
                    hintText: "New Password",
                    textInputType: TextInputType.visiblePassword,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return s.requiredField;
                      }
                      if (val.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    isObscureText: true,
                  ),
                  vGap(16.h),
                  CustomTextFormField(
                    controller: _confirmController,
                    hintText: "Confirm New Password",
                    textInputType: TextInputType.visiblePassword,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return s.requiredField;
                      }
                      if (val != _newController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    isObscureText: true,
                  ),
                  vGap(32.h),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );
                      return SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().changeMyPassword(
                                      ChangePasswordRequestBody(
                                        currentPassword:
                                            _currentController.text,
                                        password: _newController.text,
                                        rePassword: _confirmController.text,
                                      ),
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: isLoading
                              ? const GenericCircularShimmer(size: 24)
                              : const Text("Change Password"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
