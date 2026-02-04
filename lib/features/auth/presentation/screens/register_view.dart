import 'package:flutter/material.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/auth/presentation/cubit/auth_cubit.dart';
import '../widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = '/register-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const RegisterViewBody(),
        ),
      ),
    );
  }
}
