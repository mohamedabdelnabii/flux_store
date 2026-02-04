import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_assets.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_glass_button.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/features/onboarding/presentation/screens/onboarding_view.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(Assets.imagesPngOnboarding1, fit: BoxFit.cover),
        ),
        // Gradient Overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.transparent,
                  AppColors.black.withValues(alpha: 0.6),
                ],
                stops: const [0.6, 1.0],
              ),
            ),
          ),
        ),
        // Content
        Positioned(
          bottom: 60.h,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                s.welcome,
                style: AppTextStyles.font24WhiteBold.copyWith(
                  fontSize: 25.sp, // Matching precision from design if needed
                ),
                textAlign: TextAlign.center,
              ),
              vGap(10.h),
              Text(
                s.welcomeSub,
                style: AppTextStyles.font16WhiteSemiBold,
                textAlign: TextAlign.center,
              ),
              vGap(40.h),
              // Get Started Button (Glassy style)
              CustomGlassButton(
                width: 130.w,
                text: s.getStarted,
                onTap: () {
                  context.push(OnboardingView.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
