import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/helpers/spacing.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoryShimmer(),
          vGap(15.h),
          const BannerShimmer(),
          vGap(20.h),
          const ProductSectionShimmer(),
          vGap(20.h),
          const ProductSectionShimmer(),
        ],
      ),
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.grey,
                  highlightColor: AppColors.white,
                  child: Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                vGap(5.h),
                Shimmer.fromColors(
                  baseColor: AppColors.grey,
                  highlightColor: AppColors.white,
                  child: Container(
                    width: 40.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.white,
        child: Container(
          width: double.infinity,
          height: 160.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
    );
  }
}

class ProductSectionShimmer extends StatelessWidget {
  final String? title;
  const ProductSectionShimmer({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.white,
            child: Container(
              width: title != null ? null : 120.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: title != null
                  ? Text(title!, style: AppTextStyles.font18BlackBold)
                  : null,
            ),
          ),
        ),
        vGap(15.h),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(right: 15),
                child: ProductCardShimmer(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.white,
            child: Container(
              width: 160.w,
              height: 200.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
          vGap(10.h),
          Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.white,
            child: Container(
              width: 120.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          vGap(8.h),
          Container(
            width: 80.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return const ProductCardShimmer();
      },
    );
  }
}

class GenericCircularShimmer extends StatelessWidget {
  final double size;
  const GenericCircularShimmer({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      child: Container(
        width: size.w,
        height: size.w,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel Shimmer
            Shimmer.fromColors(
              baseColor: AppColors.grey,
              highlightColor: AppColors.white,
              child: Container(
                width: double.infinity,
                height: 350.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
            vGap(20.h),
            // Title Shimmer
            Shimmer.fromColors(
              baseColor: AppColors.grey,
              highlightColor: AppColors.white,
              child: Container(
                width: 200.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            vGap(10.h),
            // Category & Price Shimmer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.grey,
                  highlightColor: AppColors.white,
                  child: Container(
                    width: 100.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.grey,
                  highlightColor: AppColors.white,
                  child: Container(
                    width: 60.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ],
            ),
            vGap(20.h),
            // Quantity & Size Shimmer
            Shimmer.fromColors(
              baseColor: AppColors.grey,
              highlightColor: AppColors.white,
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            vGap(20.h),
            // Description Shimmer
            Column(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Shimmer.fromColors(
                    baseColor: AppColors.grey,
                    highlightColor: AppColors.white,
                    child: Container(
                      width: double.infinity,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            vGap(30.h),
            // Related Products Shimmer
            const ProductSectionShimmer(title: "You might also like"),
          ],
        ),
      ),
    );
  }
}
