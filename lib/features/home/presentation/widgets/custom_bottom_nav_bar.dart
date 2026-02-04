import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/theme/app_colors.dart';

import '../../../../generated/l10n.dart';
import '../cubit/bottom_nav_bar_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 4.h,
            bottom: MediaQuery.of(context).padding.bottom + 4.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withAlpha((0.2 * 255).toInt()),
                offset: const Offset(0, -2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomBottomNavBarItem(
                  title: S.of(context).home,
                  index: AppConstants.indexHome,
                  icon: FontAwesomeIcons.house,
                ),
              ),
              Expanded(
                child: CustomBottomNavBarItem(
                  title: S.of(context).search,
                  index: AppConstants.indexSearch,
                  icon: FontAwesomeIcons.magnifyingGlass,
                ),
              ),
              Expanded(
                child: CustomBottomNavBarItem(
                  title: S.of(context).cart,
                  index: AppConstants.indexCart,
                  icon: FontAwesomeIcons.cartShopping,
                ),
              ),
              Expanded(
                child: CustomBottomNavBarItem(
                  title: S.of(context).settings,
                  index: AppConstants.indexSettings,
                  icon: FontAwesomeIcons.userGear,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomBottomNavigationBarAlternative extends StatelessWidget {
  const CustomBottomNavigationBarAlternative({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withAlpha((0.2 * 255).toInt()),
                    offset: const Offset(0, -2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBottomNavBarItem(
                    title: S.of(context).home,
                    index: 0,
                    icon: FontAwesomeIcons.house,
                  ),
                  CustomBottomNavBarItem(
                    title: S.of(context).search,
                    index: 1,
                    icon: FontAwesomeIcons.magnifyingGlass,
                  ),
                  CustomBottomNavBarItem(
                    title: S.of(context).cart,
                    index: 2,
                    icon: FontAwesomeIcons.cartShopping,
                  ),
                  CustomBottomNavBarItem(
                    title: S.of(context).settings,
                    index: 3,
                    icon: FontAwesomeIcons.userGear,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).padding.bottom,
              color: AppColors.white,
            ),
          ],
        );
      },
    );
  }
}

class CustomBottomNavBarItem extends StatelessWidget {
  final String title;
  final int index;
  final IconData icon;

  const CustomBottomNavBarItem({
    super.key,
    required this.title,
    required this.index,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<BottomNavBarCubit>().currentIndex;
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        context.read<BottomNavBarCubit>().changeIndex(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withAlpha((0.2 * 255).toInt())
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                size: isSelected ? 20.w : 18.w,
                color: isSelected ? AppColors.primary : AppColors.grey,
              ),
              vGap(4.h),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: (isSelected
                    ? AppTextStyles.font12PrimaryBold
                    : AppTextStyles.font12GreyRegular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
