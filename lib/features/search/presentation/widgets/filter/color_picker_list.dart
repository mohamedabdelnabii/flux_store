import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';

class ColorPickerList extends StatefulWidget {
  final List<Color> colors;
  final ValueChanged<Color> onColorSelected;

  const ColorPickerList({
    super.key,
    required this.colors,
    required this.onColorSelected,
  });

  @override
  State<ColorPickerList> createState() => _ColorPickerListState();
}

class _ColorPickerListState extends State<ColorPickerList> {
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        separatorBuilder: (_, __) => hGap(10.w),
        itemBuilder: (context, index) {
          final color = widget.colors[index];

          return GestureDetector(
            onTap: () {
              setState(() => selectedColor = color);
              widget.onColorSelected(color);
            },
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedColor == color
                      ? AppColors.primaryDark
                      : AppColors.transparent,
                  width: 3.w,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
