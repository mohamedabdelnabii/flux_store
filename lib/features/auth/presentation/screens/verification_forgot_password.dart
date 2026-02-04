import 'package:flutter/material.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flux_store/features/auth/presentation/widgets/verification_forgot_password_view_body.dart';

class VerificationForgotPasswordView extends StatelessWidget {
  const VerificationForgotPasswordView({super.key, required this.email});
  static const String routeName = '/verification-forgot-password';
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: VerificationForgotPasswordViewBody(email: email),
        ),
      ),
    );
  }
}
