import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/home/presentation/screens/bottom_nav_bar_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/home/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:go_router/go_router.dart';

class CheckoutSuccessView extends StatelessWidget {
  static const String routeName = '/checkout-success';
  const CheckoutSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: AppColors.white, size: 60.sp),
              ),
              vGap(32.h),
              Text(
                "Checkout Completed",
                style: AppTextStyles.font24BlackBold,
                textAlign: TextAlign.center,
              ),
              vGap(16.h),
              Text(
                s.orderPlacedSuccess,
                style: AppTextStyles.font14GreyMedium,
                textAlign: TextAlign.center,
              ),
              vGap(48.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: CustomTextButton(
                  onTap: () {
                    context.read<BottomNavBarCubit>().changeIndex(0);
                    context.go(BottomNavBarView.routeName);
                  },
                  text: "CONTINUE SHOPPING",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
