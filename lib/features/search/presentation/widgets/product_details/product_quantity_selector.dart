import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';

class ProductQuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;
  final int? availableStock;

  const ProductQuantitySelector({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.availableStock,
  });

  @override
  Widget build(BuildContext context) {
    final int maxQuantity = availableStock ?? 999;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _QtyButton(
              icon: Icons.remove,
              onTap: () => onChanged(quantity > 1 ? quantity - 1 : 1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text('$quantity', style: AppTextStyles.font16BlackBold),
            ),
            _QtyButton(
              icon: Icons.add,
              onTap: quantity < maxQuantity
                  ? () => onChanged(quantity + 1)
                  : null,
            ),
          ],
        ),
        if (availableStock != null) ...[
          SizedBox(height: 4.h),
          Text(
            '$availableStock items in stock',
            style: AppTextStyles.font12PrimaryBold.copyWith(
              color: availableStock! > 10
                  ? AppColors.success
                  : availableStock! > 0
                  ? AppColors.primary
                  : AppColors.error,
            ),
          ),
        ],
      ],
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _QtyButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onTap != null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isEnabled
              ? AppColors.greyLight
              : AppColors.greyLight.withValues(alpha: 0.5),
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: isEnabled ? AppColors.black : AppColors.grey,
        ),
      ),
    );
  }
}
