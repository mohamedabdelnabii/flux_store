import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_glass_button.dart';
import 'package:flux_store/features/cart/presentation/screens/cart_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import 'package:flux_store/core/widgets/custom_network_image.dart';

class BannerSlider extends StatefulWidget {
  final List<String> images;
  const BannerSlider({super.key, required this.images});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _autoScroll();
  }

  void _autoScroll() {
    if (widget.images.isEmpty) return;
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      int nextPage = (currentIndex + 1) % widget.images.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    if (widget.images.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.paddingHorizontal,
        ),
        child: SizedBox(
          height: 220.h,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: widget.images.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (_, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(18.r),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CustomNetworkImage(
                          imageUrl: widget.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.black.withValues(alpha: 0.4),
                                AppColors.transparent,
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text(
                              s.titleOfBanners,
                              style: AppTextStyles.font20WhiteBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Indicators
              Positioned(
                bottom: 15.h,
                left: 20.w,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(widget.images.length, (index) {
                    bool isActive = index == currentIndex;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8.h,
                      width: isActive ? 24.w : 8.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isActive
                            ? AppColors.white
                            : AppColors.white.withValues(alpha: 0.5),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                bottom: 15.h,
                right: 20.w,
                child: CustomGlassButton(
                  width: 100.w,
                  text: s.shop_now,
                  onTap: () => context.push(CartView.routeName),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
