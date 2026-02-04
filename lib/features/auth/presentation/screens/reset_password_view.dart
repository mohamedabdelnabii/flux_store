import 'package:flutter/material.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flux_store/features/auth/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({
    super.key,
    required this.email,
    required this.resetToken,
  });

  static const String routeName = '/reset-password-view';
  final String email;
  final String resetToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: ResetPasswordViewBody(email: email, resetToken: resetToken),
        ),
      ),
    );
  }
}
