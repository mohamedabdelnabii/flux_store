import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_snack_bar.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/core/widgets/price_and_logo.dart';
import 'package:flux_store/features/search/presentation/widgets/filter/color_picker_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/search/presentation/cubit/search_cubit.dart';
import 'package:flux_store/generated/l10n.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  RangeValues _values = const RangeValues(10, 80);

  // NEW STATES
  Color? selectedColor;
  int? selectedRating;
  String? selectedCategory;
  String? selectedDiscount;
  String? selectedSort; // NEW

  List<Map<String, dynamic>> discount = [];
  List<String> categories = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categories = ["Men's Fashion", "Women's Fashion", "Shoes"]; // Added Shoes
  }

  @override
  void initState() {
    super.initState();
    discount = [
      {"discount": '50%'},
      {"discount": '40%'},
      {"discount": '20%'},
      {"discount": '25%'},
    ];

    // Sync with Cubit state
    final searchState = context.read<SearchCubit>().state;
    selectedCategory = searchState.category;
    selectedSort = searchState.sort;
    if (searchState.minPrice != null && searchState.maxPrice != null) {
      _values = RangeValues(searchState.minPrice!, searchState.maxPrice!);
    }
  }

  //  VALIDATION
  void showError(String message) {
    CustomSnackBar.show(
      context,
      message: message,
      icon: Icons.error_outline,
      backgroundColor: AppColors.error,
    );
  }

  //  RESET
  void resetFilters() {
    setState(() {
      _values = const RangeValues(10, 80);
      selectedColor = null;
      selectedRating = null;
      selectedCategory = null;
      selectedDiscount = null;
      selectedSort = null; // Reset sort
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      width: 1.sw,
      height: 0.85.sh,
      padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingHorizontal),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vGap(50.h),
            Row(
              children: [
                Text(s.filter, style: AppTextStyles.font18PrimaryBold),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: selectedSort != null
                        ? AppColors.primary
                        : AppColors.black,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text("Default"),
                            trailing: selectedSort == null
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () {
                              setState(() => selectedSort = null);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text("Price: Low to High"),
                            trailing: selectedSort == "price_asc"
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () {
                              setState(() => selectedSort = "price_asc");
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text("Price: High to Low"),
                            trailing: selectedSort == "price_desc"
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () {
                              setState(() => selectedSort = "price_desc");
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),

            const Divider(),

            vGap(20.h),
            Text(s.price, style: AppTextStyles.font18BlackBold),
            vGap(10.h),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.grey,
                thumbColor: AppColors.greyLight,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.r),
              ),
              child: RangeSlider(
                values: _values,
                min: 0,
                max: 100,
                divisions: 100,
                onChanged: (v) {
                  setState(() {
                    _values = v;
                  });
                },
              ),
            ),
            vGap(10.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.paddingHorizontal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceAndLogo(price: _values.start),
                  PriceAndLogo(price: _values.end),
                ],
              ),
            ),
            vGap(20.h),

            // COLORS
            Text(s.color, style: AppTextStyles.font18BlackBold),
            vGap(10.h),
            ColorPickerList(
              colors: [
                AppColors.error,
                AppColors.primary,
                AppColors.green,
                AppColors.black,
                AppColors.warning,
                AppColors.whatsapp,
              ],
              onColorSelected: (color) {
                setState(() {
                  selectedColor = color;
                });
              },
            ),

            vGap(20.h),

            // RATING
            Text(s.starRating, style: AppTextStyles.font18BlackBold),
            vGap(10.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: List.generate(
            //     5,
            //     (i) => GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           selectedRating = i + 1; // NEW
            //         });
            //       },
            //       child: Container(
            //         padding: const EdgeInsets.all(10),
            //         decoration: BoxDecoration(
            //           color: selectedRating == i + 1
            //               ? AppColors.primaryLight
            //               : AppColors.greyLight,
            //           shape: BoxShape.circle,
            //           border: Border.all(color: AppColors.primaryLight),
            //         ),
            //         child: Text("⭐${i + 1}"),
            //       ),
            //     ),
            //   ),
            // ),
            Wrap(
              spacing: 8.w,
              children: List.generate(5, (i) {
                final value = 5 - i;
                return _ratingChip(
                  label: '$value ⭐',
                  selected: selectedRating == value,
                  onTap: () => setState(() => selectedRating = value),
                );
              }),
            ),

            vGap(30.h),

            // CATEGORY
            Text(s.category, style: AppTextStyles.font18BlackBold),
            vGap(10.h),
            GestureDetector(
              onTap: () {
                showCategoryMenu();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(color: AppColors.primaryLight),
                ),
                child: Row(
                  children: [
                    Icon(Icons.checkroom_outlined, size: 22.sp),
                    hGap(20.w),
                    Text(
                      selectedCategory ?? s.selectCategory,
                      style: AppTextStyles.font16PrimaryBold,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            vGap(30.h),

            // DISCOUNT
            Text(s.discount, style: AppTextStyles.font18BlackBold),
            vGap(10.h),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: List.generate(discount.length, (index) {
                final item = discount[index];
                final dis = item["discount"];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDiscount = dis;
                    });
                  },
                  child: SizedBox(
                    width:
                        (MediaQuery.of(context).size.width -
                            (AppConstants.paddingHorizontal * 2) -
                            12.w) /
                        2,
                    child: discountChip(
                      discount: dis,
                      selected: selectedDiscount == dis,
                      // onRemove: () {
                      //   setState(() {
                      //     discount.removeAt(index);
                      //   });
                      // },
                    ),
                  ),
                );
              }),
            ),

            vGap(40.h),

            // BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: resetFilters,
                  child: Text(
                    s.reset,
                    style: AppTextStyles.font18BlackBold.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                hGap(50.w),
                CustomTextButton(
                  width: 100.w,
                  onTap: () {
                    context.read<SearchCubit>().search(
                      category: selectedCategory,
                      minPrice: _values.start,
                      maxPrice: _values.end,
                      sort: selectedSort,
                    );
                    Navigator.pop(context);
                  },
                  text: s.apply,
                ),
              ],
            ),
            vGap(60.h),
          ],
        ),
      ),
    );
  }

  Widget _ratingChip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withValues(alpha: 0.08)
              : AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.greyLight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withValues(alpha: 0.3),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: AppTextStyles.font14BlackMedium.copyWith(
            color: selected ? AppColors.primary : AppColors.black,
          ),
        ),
      ),
    );
  }

  Widget discountChip({
    required String discount,
    required bool selected,
    // required VoidCallback onRemove,
  }) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryLight : AppColors.grey,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(discount, style: AppTextStyles.font14BlackMedium),
          hGap(30.w),
          Icon(
            Icons.highlight_remove_outlined,
            size: 16.sp,
            color: AppColors.greyLight,
          ),
        ],
      ),
    );
  }

  void showCategoryMenu() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).selectCategory,
                style: AppTextStyles.font18BlackBold,
              ),
              SizedBox(height: 20.h),
              ...categories.map((c) {
                return ListTile(
                  leading: Icon(
                    Icons.checkroom_outlined,
                    color: AppColors.primary,
                  ),
                  title: Text(c, style: AppTextStyles.font16BlackMedium),
                  onTap: () {
                    setState(() {
                      selectedCategory = c;
                    });
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildColorChip(Color color, bool isSelected) {
  //     return Container(
  //       padding: const EdgeInsets.all(4),
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         border: isSelected ? Border.all(color: AppColors.grey, width: 2) : null,
  //       ),
  //       child: CircleAvatar(radius: 12, backgroundColor: color),
  //     );
  //   }
  //
  //   Widget _buildSizeChip(String label, bool isSelected) {
  //     return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  //       decoration: BoxDecoration(
  //         color: isSelected ? AppColors.black : AppColors.white,
  //         borderRadius: BorderRadius.circular(20.r),
  //         border: Border.all(
  //           color: isSelected ? AppColors.black : AppColors.grey,
  //         ),
  //       ),
  //       child: Text(
  //         label,
  //         style: isSelected
  //             ? AppTextStyles.font14WhiteBold
  //             : AppTextStyles.font14BlackMedium,
  //       ),
  //     );
  //   }
}
