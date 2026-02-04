import 'package:flutter/material.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import '../widgets/auth_success_view_body.dart';

class AuthSuccessView extends StatelessWidget {
  const AuthSuccessView({super.key});
  static const String routeName = '/auth-success-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: AuthSuccessViewBody(),
    );
  }
}
