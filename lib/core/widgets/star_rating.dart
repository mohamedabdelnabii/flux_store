import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating, this.size = 16});

  final double rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) =>
              Icon(Icons.star, color: AppColors.secondary),
          itemCount: 5,
          itemSize: size.r,
          unratedColor: AppColors.secondary.withValues(alpha: 0.3),
        ),
        SizedBox(width: 4.w),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            "(${rating.toStringAsFixed(1)})",
            style: AppTextStyles.font12GreyRegular.copyWith(
              fontSize: (size * 0.75).sp,
            ),
          ),
        ),
      ],
    );
  }
}
