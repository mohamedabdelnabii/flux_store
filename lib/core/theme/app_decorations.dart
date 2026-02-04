import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppDecorations {
  AppDecorations._();

  /// Circular container with shadow decoration
  static BoxDecoration get circularShadow => BoxDecoration(
    color: AppColors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: AppColors.primaryLight,
        offset: const Offset(0, 2),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ],
  );

  /// Circular container with custom color and shadow
  static BoxDecoration circularShadowWithColor(Color color) => BoxDecoration(
    color: color,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: AppColors.primary,
        offset: const Offset(0, 2),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ],
  );

  /// Rounded container with shadow decoration
  static BoxDecoration roundedShadow({
    double borderRadius = 12.0,
    Color? color,
  }) => BoxDecoration(
    color: color ?? AppColors.white,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: AppColors.grey.withValues(alpha: 0.3),
        offset: const Offset(0, 2),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ],
  );
}
