import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_row.dart';
import 'package:flux_store/features/home/presentation/widgets/products/product_card.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/features/search/presentation/widgets/search/search_card.dart';
import 'package:flux_store/generated/l10n.dart';

import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  List<String> history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
    // Load default products for "Popular this week"
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchCubit>().search();
    });
  }

  Future<void> _loadHistory() async {
    final list = await SharedPrefHelper.getStringList(
      AppConstants.recentSearches,
    );
    setState(() {
      history = list;
    });
  }

  Future<void> _saveToHistory(String query) async {
    if (query.trim().isEmpty) return;
    if (history.contains(query)) {
      history.remove(query);
    }
    history.insert(0, query);
    if (history.length > 10) history.removeLast();
    await SharedPrefHelper.setData(AppConstants.recentSearches, history);
    setState(() {});
  }

  Future<void> _clearHistory() async {
    await SharedPrefHelper.removeData(AppConstants.recentSearches);
    setState(() {
      history.clear();
    });
  }

  Future<void> _removeFromHistory(int index) async {
    setState(() {
      history.removeAt(index);
    });
    await SharedPrefHelper.setData(AppConstants.recentSearches, history);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.paddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchCard(
              isSearchPage: true,
              onChanged: (val) {
                context.read<SearchCubit>().onSearchChanged(val);
                if (val.trim().length > 2) {
                  _saveToHistory(val);
                }
              },
            ),
            vGap(20.h),

            Row(
              children: [
                Text(s.recentSearches, style: AppTextStyles.font14GrayMedium),
                const Spacer(),
                IconButton(
                  onPressed: _clearHistory,
                  icon: Icon(
                    Icons.delete_outline_outlined,
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),

            /// Wrap of recent searches
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: List.generate(history.length, (index) {
                final item = history[index];

                return SizedBox(
                  width:
                      (MediaQuery.of(context).size.width -
                          (AppConstants.paddingHorizontal * 2) -
                          12.w) /
                      2,
                  child: productOfSearch(
                    name: item,
                    onRemove: () => _removeFromHistory(index),
                  ),
                );
              }),
            ),

            vGap(20.h),

            CustomTextRow(
              title: s.popularThisWeek,
              subTitle: s.showAll,
              onTap: () {
                context.read<SearchCubit>().search();
              },
            ),
            vGap(10.h),

            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                final isLoading = state.isLoading;
                final searchResponse = state.searchResponse;
                final isQueryEmpty = (state.query ?? "").isEmpty;

                if (isLoading && searchResponse == null) {
                  return const ProductGridShimmer();
                }

                if (searchResponse != null) {
                  final products = searchResponse.products ?? [];

                  if (products.isEmpty) {
                    return _buildNoResults(isLoading, s);
                  }

                  // If query is empty, only show top 4 as "Popular"
                  final displayProducts = isQueryEmpty
                      ? products.take(4).toList()
                      : products;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: displayProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 0.62,
                    ),
                    itemBuilder: (context, index) {
                      final item = displayProducts[index];
                      return ProductCard(
                        image: item.imageCover ?? '',
                        title: item.title ?? '',
                        price: (item.price ?? 0).toDouble(),
                        id: item.id,
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResults(bool isLoading, S s) {
    if (isLoading) return const ProductGridShimmer();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80.sp, color: AppColors.grey),
          vGap(16.h),
          Text(s.no_search_results, style: AppTextStyles.font16BlackBold),
          Text(
            "Try checking your spelling or use different keywords",
            style: AppTextStyles.font14GreyRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget productOfSearch({
    required String name,
    required VoidCallback onRemove,
  }) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: AppTextStyles.font14BlackMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: Icon(
              Icons.highlight_remove_outlined,
              size: 16.sp,
              color: AppColors.greyLight,
            ),
          ),
        ],
      ),
    );
  }
}
