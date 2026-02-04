import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/features/search/presentation/widgets/filter/filter_sheet.dart';
import 'package:flux_store/generated/l10n.dart';

class SearchCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isSearchPage;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterPressed;

  const SearchCard({
    super.key,
    this.onTap,
    this.isSearchPage = false,
    this.onChanged,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: isSearchPage ? null : onTap,
            child: Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.primaryLight,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search_outlined,
                    size: isSearchPage ? 24.sp : 16.sp,
                    color: AppColors.greyLight,
                  ),
                  hGap(10.w),
                  Expanded(
                    child: isSearchPage
                        ? TextField(
                            onChanged: onChanged,
                            style: AppTextStyles.font14GrayMedium.copyWith(
                              color: AppColors.greyLight,
                            ),
                            decoration: InputDecoration(
                              hintText: s.search,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          )
                        : Text(
                            s.search,
                            style: AppTextStyles.font14GrayMedium.copyWith(
                              color: AppColors.greyLight,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),

        hGap(10.w),
        Container(
          height: 50.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.primaryLight,
          ),
          child: IconButton(
            onPressed: () {
              final searchCubit = context.read<SearchCubit>();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: AppColors.transparent,
                builder: (_) => BlocProvider.value(
                  value: searchCubit,
                  child: const FilterSheet(),
                ),
              );
            },
            icon: Icon(
              Icons.filter_list_outlined,
              size: 24.sp,
              color: AppColors.greyLight,
            ),
          ),
        ),
      ],
    );
  }
}
