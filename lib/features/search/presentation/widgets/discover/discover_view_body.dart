import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/widgets/custom_header_with_icon.dart';
import 'package:flux_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:flux_store/features/home/presentation/screens/notifications_view.dart';
import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';
import 'package:flux_store/features/search/presentation/screens/search_view.dart';
import 'package:flux_store/features/search/presentation/widgets/search/search_card.dart';
import 'package:flux_store/features/search/presentation/widgets/discover/section_search_card.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';

class DiscoverViewBody extends StatefulWidget {
  const DiscoverViewBody({super.key});

  @override
  State<DiscoverViewBody> createState() => _DiscoverViewBodyState();
}

class _DiscoverViewBodyState extends State<DiscoverViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    // List of background colors for category cards
    final List<Color> cardColors = [
      AppColors.grey.withAlpha(50),
      AppColors.primaryLight.withAlpha(50),
      AppColors.green.withAlpha(50),
      AppColors.primary.withAlpha(50),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.paddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderWithIconOrNot(
              title: s.discover,
              onTapR: () {},
              onTapL: () {
                context.push(NotificationsView.routeName);
              },
              iconR: Icons.menu_outlined,
              iconL: Icons.notifications,
            ),
            vGap(20.h),
            SearchCard(
              onTap: () {
                context.push(SearchView.routeName);
              },
            ),
            vGap(20.h),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(child: HomeShimmer()),
                  success: (homeResponse) {
                    final categories = (homeResponse.categories ?? [])
                        .where(
                          (c) =>
                              c.name == "Men's Fashion" ||
                              c.name == "Women's Fashion" ||
                              c.name == "Electronics",
                        ) // API might not have Shoes directly
                        .toList();

                    return ListView.separated(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      separatorBuilder: (context, index) => vGap(20.h),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final color = cardColors[index % cardColors.length];

                        return SectionSearchCard(
                          imageUrl: category.image ?? '',
                          title: category.name ?? '',
                          color: color,
                          onTap: () {
                            context.read<SearchCubit>().search(
                              category: category.name,
                            );
                            context.push(SearchView.routeName);
                          },
                        );
                      },
                    );
                  },
                  error: (error) => Center(child: Text(error)),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
            vGap(20.h),
          ],
        ),
      ),
    );
  }
}
