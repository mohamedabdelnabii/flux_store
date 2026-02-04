import 'package:flutter/material.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import '../widgets/voucher_view_body.dart';

class VoucherView extends StatelessWidget {
  const VoucherView({super.key});
  static const String routeName = '/voucher-view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(child: VoucherViewBody()),
    );
  }
}
