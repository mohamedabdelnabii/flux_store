import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_assets.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class PriceAndLogo extends StatelessWidget {
  const PriceAndLogo({
    super.key,
    required this.price,
    this.size = 12,
    this.color = AppColors.black,
  });

  final double price;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final imageSize = (size * 1.1).sp;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          price.toStringAsFixed(2),
          style: AppTextStyles.font16BlackBold.copyWith(
            color: color,
            fontSize: size.sp,
            height: 1.0,
          ),
        ),
        const SizedBox(width: 3),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Image.asset(
            Assets.imagesPngSAR,
            color: color,
            height: imageSize,
            width: imageSize,
          ),
        ),
      ],
    );
  }
}
