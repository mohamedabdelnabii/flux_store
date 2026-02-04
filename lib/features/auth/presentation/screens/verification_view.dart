import 'package:flutter/material.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import '../widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.userId});
  static const String routeName = '/verification-view';
  final int userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(child: VerificationViewBody(userId: userId)),
    );
  }
}
