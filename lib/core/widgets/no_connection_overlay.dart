import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/cubit/connection/connection_cubit.dart';
import 'package:flux_store/core/helpers/app_assets.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:lottie/lottie.dart';

class NoConnectionOverlay extends StatelessWidget {
  const NoConnectionOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionCubit, ConnectionStatus>(
      builder: (context, connectionStatus) {
        if (connectionStatus == ConnectionStatus.connected) {
          return const SizedBox.shrink();
        }

        return Positioned.fill(
          child: Material(
            color: AppColors.black.withValues(alpha: 0.85),
            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.black.withValues(alpha: 0.85),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.w),
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Lottie Animation
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            decoration: BoxDecoration(
                              color: AppColors.error.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Lottie.asset(
                              Assets.imagesLottieNoInternet,
                              width: MediaQuery.of(context).size.width - 120,
                              fit: BoxFit.contain,
                              repeat: true,
                              animate: true,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'لا يوجد اتصال بالإنترنت',
                            style: AppTextStyles.font18BlackBold,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى',
                              style: AppTextStyles.font14GreyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          // Loading indicator
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.primary,
                                ),
                                strokeWidth: 2.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
