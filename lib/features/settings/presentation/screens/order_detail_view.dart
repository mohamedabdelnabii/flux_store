import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/cart/data/models/cart_item_model.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'order_tracking_view.dart';
import 'rate_product_view.dart';

class OrderDetailView extends StatelessWidget {
  static const String routeName = '/order-detail';
  final String? orderId;
  const OrderDetailView({super.key, this.orderId});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      appBar: CustomBackAppBar(title: "Order Details"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderInfo(s),
            vGap(24.h),
            Text("Items", style: AppTextStyles.font16BlackBold),
            vGap(16.h),
            _buildItemsList(),
            vGap(24.h),
            _buildSummary(s),
            vGap(40.h),
            _buildActionButtons(context, s),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfo(S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _infoRow("Order ID", "#1947034"),
          vGap(8.h),
          _infoRow("Date", "05/12/2023"),
          vGap(8.h),
          _infoRow("Status", s.delivered, isStatus: true),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value, {bool isStatus = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.font14GreyMedium),
        Text(
          value,
          style: isStatus
              ? AppTextStyles.font14SuccessBold
              : AppTextStyles.font14BlackBold,
        ),
      ],
    );
  }

  Widget _buildItemsList() {
    // Mock items
    final items = [
      CartItemModel(
        id: '1',
        productId: 'p1',
        name: 'Sportswear Set',
        image: '', // Use real assets if available
        price: 80.0,
        quantity: 1,
        size: 'L',
        color: 'Cream',
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.greyLight,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(Icons.image_outlined),
              ),
              hGap(16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: AppTextStyles.font14BlackBold),
                    vGap(4.h),
                    Text(
                      "Size: ${item.size} | Color: ${item.color}",
                      style: AppTextStyles.font14GrayMedium,
                    ),
                  ],
                ),
              ),
              Text(
                "\$${item.price.toStringAsFixed(2)}",
                style: AppTextStyles.font14BlackBold,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummary(S s) {
    return Column(
      children: [
        _summaryRow(s.subtotal, 80.0),
        vGap(8.h),
        _summaryRow(s.shipping, 10.0),
        vGap(12.h),
        const Divider(),
        vGap(12.h),
        _summaryRow(s.total, 90.0, isTotal: true),
      ],
    );
  }

  Widget _summaryRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.font16BlackBold
              : AppTextStyles.font14GreyMedium,
        ),
        Text(
          "\$${amount.toStringAsFixed(2)}",
          style: isTotal
              ? AppTextStyles.font18PrimaryBold.copyWith(color: AppColors.black)
              : AppTextStyles.font14BlackBold,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, S s) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: OutlinedButton(
            onPressed: () => context.push(RateProductView.routeName),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            child: Text("RATE PRODUCT", style: AppTextStyles.font14BlackBold),
          ),
        ),
        vGap(16.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: CustomTextButton(
            width: double.infinity,
            onTap: () => context.push(OrderTrackingView.routeName),
            text: "TRACK ORDER",
          ),
        ),
      ],
    );
  }
}
