import 'package:flutter/material.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/generated/l10n.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String message, {
  bool doublePop = false,
  VoidCallback? onPressed,
}) async {
  if (context.mounted) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(
          message,
          style: AppTextStyles.font16BlackBold,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed:
                onPressed ??
                () {
                  Navigator.of(context).pop();
                  if (doublePop) {
                    Navigator.of(context).pop();
                  }
                },
            child: Text(S.of(context).ok, style: AppTextStyles.font16BlackBold),
          ),
        ],
      ),
    );
  }
}
