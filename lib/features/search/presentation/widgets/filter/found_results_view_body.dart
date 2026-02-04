import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/features/home/presentation/widgets/products/product_card.dart';
import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/features/search/presentation/widgets/filter/filter_sheet.dart';
import 'package:flux_store/generated/l10n.dart';

class FoundResultsViewBody extends StatefulWidget {
  const FoundResultsViewBody({super.key});

  @override
  State<FoundResultsViewBody> createState() => _FoundResultsViewBodyState();
}

class _FoundResultsViewBodyState extends State<FoundResultsViewBody> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: (query, category, minPrice, maxPrice, sort) => const Padding(
            padding: EdgeInsets.all(20),
            child: ProductGridShimmer(),
          ),
          success: (searchResponse, query, category, minPrice, maxPrice, sort) {
            final products = searchResponse.products ?? [];
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingHorizontal,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${s.foundResults} (${products.length})",
                          style: AppTextStyles.font16BlackBold,
                        ),
                        InkWell(
                          onTap: () {
                            final searchCubit = context.read<SearchCubit>();
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => BlocProvider.value(
                                value: searchCubit,
                                child: const FilterSheet(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.greyLight,
                              borderRadius: BorderRadius.circular(25.r),
                              border: Border.all(color: AppColors.primaryLight),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  s.filter,
                                  style: AppTextStyles.font14BlackMedium,
                                ),
                                hGap(20.w),
                                Icon(
                                  Icons.filter_list,
                                  size: 20.sp,
                                  color: AppColors.greyDark,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    vGap(20.h),
                    if (products.isEmpty)
                      Center(child: Text(s.no_search_results))
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 0.62,
                        ),
                        itemBuilder: (context, index) {
                          final item = products[index];
                          return ProductCard(
                            image: item.imageCover ?? '',
                            title: item.title ?? '',
                            price: (item.price ?? 0).toDouble(),
                            id: item.id,
                          );
                        },
                      ),
                  ],
                ),
              ),
            );
          },
          orElse: () => Center(child: Text(s.type_to_search)),
        );
      },
    );
  }
}
