import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/generated/l10n.dart';

class CartSummaryWidget extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double discount;

  const CartSummaryWidget({
    super.key,
    required this.subtotal,
    this.shipping = 0,
    this.discount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final total = subtotal + shipping - discount;

    return Column(
      children: [
        _summaryRow(s.subtotal, subtotal),
        vGap(12.h),
        _summaryRow(s.discount, -discount, isDiscount: true),
        vGap(12.h),
        _summaryRow(s.shipping, shipping),
        vGap(12.h),
        Divider(color: AppColors.greyLight, thickness: 1.h),
        vGap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(s.total, style: AppTextStyles.font16BlackBold),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: AppTextStyles.font16BlackBold,
            ),
          ],
        ),
      ],
    );
  }

  Widget _summaryRow(String label, double amount, {bool isDiscount = false}) {
    if (isDiscount && amount == 0) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.font14GreyMedium),
        Text(
          '${amount < 0 ? "-" : ""}\$${amount.abs().toStringAsFixed(2)}',
          style: isDiscount
              ? AppTextStyles.font14PrimaryBold.copyWith(
                  color: AppColors.success,
                )
              : AppTextStyles.font14BlackBold,
        ),
      ],
    );
  }
}
