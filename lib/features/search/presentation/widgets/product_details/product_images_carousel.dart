import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/widgets/custom_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImagesCarousel extends StatefulWidget {
  final List<String> images;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback onBackDatePressed;

  const ProductImagesCarousel({
    super.key,
    required this.images,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onBackDatePressed,
  });

  @override
  State<ProductImagesCarousel> createState() => _ProductImagesCarouselState();
}

class _ProductImagesCarouselState extends State<ProductImagesCarousel> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 400.h,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.images.length,
                itemBuilder: (_, i) => CustomNetworkImage(
                  imageUrl: widget.images[i],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400.h,
                ),
              ),
            ),
            Positioned(
              top: 20.h,
              left: 20.w,
              right: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: widget.onBackDatePressed,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  // Favorite Button
                  GestureDetector(
                    onTap: widget.onFavoritePressed,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 18.sp,
                        color: widget.isFavorite
                            ? AppColors.error
                            : AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        vGap(8.h),
        if (widget.images.length > 1)
          SmoothPageIndicator(
            controller: _pageController,
            count: widget.images.length,
            effect: ExpandingDotsEffect(
              dotHeight: 6.h,
              dotWidth: 6.h,
              activeDotColor: AppColors.primary,
              dotColor: AppColors.greyLight,
            ),
          ),
      ],
    );
  }
}
