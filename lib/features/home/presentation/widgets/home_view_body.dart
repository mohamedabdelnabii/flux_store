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

import 'package:flux_store/features/categories/data/models/category_response.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeResponse = state.homeResponse;
        final isLoading = state.isLoading;
        final error = state.error;

        if (error != null && homeResponse == null) {
          return Center(
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
          );
        }

        return RefreshIndicator(
          onRefresh: () => context.read<HomeCubit>().getHomeData(),
          child: CustomScrollView(
            slivers: [
              const HomeAppBar(),
              SliverToBoxAdapter(child: vGap(20.h)),

              // Category Selector
              if (isLoading && homeResponse == null)
                const SliverToBoxAdapter(child: CategoryShimmer())
              else if (homeResponse != null)
                CategorySelector(categories: homeResponse.categories ?? []),

              SliverToBoxAdapter(child: vGap(20.h)),

              // Banners
              if (isLoading && homeResponse == null)
                const SliverToBoxAdapter(child: BannerShimmer())
              else if (homeResponse != null)
                BannerSlider(
                  images: (homeResponse.products ?? [])
                      .where(
                        (e) => e.imageCover != null && e.imageCover!.isNotEmpty,
                      )
                      .take(3)
                      .map((e) => e.imageCover!)
                      .toList(),
                ),

              SliverToBoxAdapter(child: vGap(20.h)),

              // Dynamic Content based on selection
              if (state.selectedCategoryId != null) ...[
                SliverToBoxAdapter(
                  child: MensProductsSection(
                    categoryId: state.selectedCategoryId!,
                    title: state.selectedCategoryName ?? "Products",
                  ),
                ),
              ] else ...[
                // Featured Products
                if (isLoading && homeResponse == null)
                  const SliverToBoxAdapter(child: ProductSectionShimmer())
                else if (homeResponse != null)
                  FeatureProductsSection(products: homeResponse.products ?? []),

                SliverToBoxAdapter(child: vGap(20.h)),

                // Men's Collection
                if (isLoading && homeResponse == null)
                  const SliverToBoxAdapter(child: ProductSectionShimmer())
                else if (homeResponse != null)
                  Builder(
                    builder: (context) {
                      final mensCategory = homeResponse.categories?.firstWhere(
                        (cat) => cat.name == "Men's Fashion",
                        orElse: () => CategoryModel(),
                      );
                      if (mensCategory != null && mensCategory.id != null) {
                        return SliverToBoxAdapter(
                          child: MensProductsSection(
                            categoryId: mensCategory.id.toString(),
                            title: "Men's Collection",
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                  ),

                SliverToBoxAdapter(child: vGap(20.h)),

                // Women's Collection
                if (isLoading && homeResponse == null)
                  const SliverToBoxAdapter(child: ProductSectionShimmer())
                else if (homeResponse != null)
                  Builder(
                    builder: (context) {
                      final womensCategory = homeResponse.categories
                          ?.firstWhere(
                            (cat) => cat.name == "Women's Fashion",
                            orElse: () => CategoryModel(),
                          );
                      if (womensCategory != null && womensCategory.id != null) {
                        return SliverToBoxAdapter(
                          child: WomensProductsSection(
                            categoryId: womensCategory.id.toString(),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                  ),
              ],

              SliverToBoxAdapter(child: vGap(30.h)),
            ],
          ),
        );
      },
    );
  }
}
