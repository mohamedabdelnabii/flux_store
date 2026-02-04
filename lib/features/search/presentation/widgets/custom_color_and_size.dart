import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/generated/l10n.dart';

class CustomColorAndSize extends StatefulWidget {
  final Function(Color) onColorSelected;
  final Function(String) onSizeSelected;

  const CustomColorAndSize({
    super.key,
    required this.onColorSelected,
    required this.onSizeSelected,
  });

  @override
  State<CustomColorAndSize> createState() => _CustomColorAndSizeState();
}

class _CustomColorAndSizeState extends State<CustomColorAndSize> {
  Color? selectedColor;
  String? selectedSize;

  final List<Color> colors = [
    AppColors.warning,
    AppColors.black,
    AppColors.error,
  ];

  final List<String> sizes = ["S", "M", "L"];

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // COLORS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.color, style: AppTextStyles.font16BlackBold),
                vGap(12.h),
                Row(children: colors.map((c) => _colorCircle(c)).toList()),
              ],
            ),
          ),
          // SIZES
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(s.sizes, style: AppTextStyles.font16BlackBold),
              vGap(12.h),
              Row(children: sizes.map((st) => _sizeBox(st)).toList()),
            ],
          ),
        ],
      ),
    );
  }

  /// COLOR CIRCLE
  Widget _colorCircle(Color color) {
    final bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() => selectedColor = color);
        widget.onColorSelected(color);
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.black : AppColors.transparent,
            width: 1.5.w,
          ),
        ),
        child: Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// SIZE BOX
  Widget _sizeBox(String size) {
    final bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() => selectedSize = size);
        widget.onSizeSelected(size);
      },
      child: Container(
        width: 36.w,
        height: 36.w,
        margin: EdgeInsets.only(left: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? AppColors.black
                : AppColors.grey.withValues(alpha: 0.3),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          size,
          style: AppTextStyles.font14BlackMedium.copyWith(
            color: isSelected ? AppColors.white : AppColors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
