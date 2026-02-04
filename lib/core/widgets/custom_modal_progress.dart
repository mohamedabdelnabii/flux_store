import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../theme/app_colors.dart';

class CustomModalProgress extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const CustomModalProgress({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: AppColors.black,
      ),
      child: child,
    );
  }
}
