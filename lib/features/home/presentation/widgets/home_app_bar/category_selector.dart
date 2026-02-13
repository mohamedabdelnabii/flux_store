import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:flux_store/features/categories/data/models/category_response.dart';

class CategorySelector extends StatefulWidget {
  final List<CategoryModel> categories;
  const CategorySelector({super.key, required this.categories});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.categories.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 85.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length + 1,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemBuilder: (context, index) {
            final isAll = index == 0;
            final category = isAll ? null : widget.categories[index - 1];
            bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
                context.read<HomeCubit>().selectCategory(
                  isAll ? null : category?.id?.toString(),
                  isAll ? null : category?.name,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 55.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? AppColors.primaryLight
                            : AppColors.greySubtle,
                      ),
                      child: ClipOval(
                        child: isAll
                            ? Icon(Icons.apps, color: AppColors.primary)
                            : CustomNetworkImage(
                                imageUrl: category?.image ?? '',
                                width: 55.w,
                                height: 55.h,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    vGap(5.h),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: isSelected
                          ? AppTextStyles.font12BlackBold
                          : AppTextStyles.font12GrayRegular,
                      child: Text(isAll ? "All" : category?.name ?? ''),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
