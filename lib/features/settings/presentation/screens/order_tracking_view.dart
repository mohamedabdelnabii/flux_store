import 'package:flutter/material.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import '../widgets/order_tracking_view_body.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});
  static const String routeName = '/order-tracking';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(child: OrderTrackingViewBody()),
    );
  }
}
