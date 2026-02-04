import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:flux_store/features/home/presentation/widgets/home_app_bar/category_selector.dart';
import 'package:flux_store/features/home/presentation/widgets/home_app_bar/home_app_bar.dart';
import 'package:flux_store/features/home/presentation/widgets/home_banners/banner_slider.dart';
import 'package:flux_store/features/home/presentation/widgets/products/feature_products_section.dart';
import 'package:flux_store/features/home/presentation/widgets/products/mens_products_section.dart';
import 'package:flux_store/features/home/presentation/widgets/products/womens_products_section.dart';
import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

import 'package:flux_store/features/home/data/models/home_response.dart';
import 'package:flux_store/features/categories/data/models/category_response.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const HomeShimmer(),
          error: (error) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                vGap(16.h),
                Text(error),
                vGap(16.h),
                ElevatedButton(
                  onPressed: () => context.read<HomeCubit>().getHomeData(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          success: (HomeResponse homeResponse) {
            final List<CategoryModel> categories =
                homeResponse.categories ?? [];

            CategoryModel? mensCategory;
            CategoryModel? womensCategory;

            for (final CategoryModel cat in categories) {
              if (cat.name == "Men's Fashion") mensCategory = cat;
              if (cat.name == "Women's Fashion") womensCategory = cat;
            }

            // Extract 3 product images for the banner
            final bannerImages = (homeResponse.products ?? [])
                .where((e) => e.imageCover != null && e.imageCover!.isNotEmpty)
                .take(3)
                .map((e) => e.imageCover!)
                .toList();

            return RefreshIndicator(
              onRefresh: () => context.read<HomeCubit>().getHomeData(),
              child: CustomScrollView(
                slivers: [
                  const HomeAppBar(),
                  SliverToBoxAdapter(child: vGap(20.h)),

                  // Category Selector
                  CategorySelector(categories: categories),
                  SliverToBoxAdapter(child: vGap(20.h)),

                  // Banners
                  BannerSlider(images: bannerImages),
                  SliverToBoxAdapter(child: vGap(20.h)),

                  // Featured Products
                  FeatureProductsSection(products: homeResponse.products ?? []),
                  SliverToBoxAdapter(child: vGap(20.h)),

                  // Men's Collection
                  if (mensCategory != null && mensCategory.id != null)
                    SliverToBoxAdapter(
                      child: MensProductsSection(
                        categoryId: mensCategory.id.toString(),
                      ),
                    ),

                  SliverToBoxAdapter(child: vGap(20.h)),

                  // Women's Collection
                  if (womensCategory != null && womensCategory.id != null)
                    SliverToBoxAdapter(
                      child: WomensProductsSection(
                        categoryId: womensCategory.id.toString(),
                      ),
                    ),

                  SliverToBoxAdapter(child: vGap(30.h)),
                ],
              ),
            );
          },
          orElse: () => const HomeShimmer(),
        );
      },
    );
  }
}
