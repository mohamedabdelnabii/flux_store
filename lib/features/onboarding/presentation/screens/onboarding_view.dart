import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_assets.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_glass_button.dart';
import 'package:flux_store/features/auth/presentation/screens/Login_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<Map<String, String>> onboardingData = [
      {
        "image": Assets.imagesPngOnboarding2,
        "title": s.onBoarding1,
        "subtitle": s.onBoarding1SubTitle,
      },
      {
        "image": Assets.imagesPngOnboarding3,
        "title": s.onBoarding2,
        "subtitle": s.onBoarding2SubTitle,
      },
      {
        "image": Assets.imagesPngOnboarding4,
        "title": s.onBoarding3,
        "subtitle": s.onBoarding3SubTitle,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Main Content
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              final data = onboardingData[index];
              return _OnboardingPage(data: data);
            },
          ),
          // Dark Bottom Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF464447),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Dots Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => _buildDot(index),
                    ),
                  ),
                  vGap(30.h),
                  // Button
                  CustomGlassButton(
                    width: 150.w,
                    onTap: () {
                      if (_currentPage == onboardingData.length - 1) {
                        SharedPrefHelper.setData(
                          AppConstants.prefsIsNotFirstLogin,
                          true,
                        );
                        context.go(LoginView.routeName);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    text: s.shopNow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    bool isSelected = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 8.h,
      width: isSelected ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.white
            : AppColors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final Map<String, String> data;

  const _OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(80.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Text(
                data["title"]!,
                style: AppTextStyles.font20BlackBold.copyWith(fontSize: 22.sp),
                textAlign: TextAlign.center,
              ),
              vGap(12.h),
              Text(
                data["subtitle"]!,
                style: AppTextStyles.font14GreyRegular.copyWith(
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        vGap(40.h),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 220.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: AssetImage(data["image"]!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
