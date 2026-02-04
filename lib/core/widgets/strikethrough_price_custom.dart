import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

import '../helpers/app_assets.dart';

class StrikethroughPriceCustom extends StatelessWidget {
  final double price;
  final double size;
  final Color strikeColor;

  const StrikethroughPriceCustom({
    super.key,
    required this.price,
    this.size = 10,
    this.strikeColor = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StrikeThroughPainter(color: strikeColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            price.toString(),
            style: AppTextStyles.font16BlackBold.copyWith(
              color: strikeColor,
              fontSize: size.sp,
              height: 1.0,
            ),
          ),
          SizedBox(width: 2.w),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Image.asset(
              Assets.imagesPngSAR,
              color: strikeColor,
              height: (size * 1.0).sp,
              width: (size * 1.0).sp,
            ),
          ),
        ],
      ),
    );
  }
}

class StrikeThroughPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  StrikeThroughPainter({required this.color, this.strokeWidth = 1});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height / 2.8),
      Offset(size.width, size.height / 2.8),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
