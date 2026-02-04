import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/cubit/language/language_cubit.dart';
import 'package:flux_store/features/settings/presentation/screens/language_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/generated/l10n.dart';

class SettingsView extends StatefulWidget {
  static const String routeName = '/settings';
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      backgroundColor: AppColors.white,
      appBar: CustomBackAppBar(title: s.settings),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            _buildSettingTile(
              title: "Notifications",
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (val) {
                  setState(() {
                    _notificationsEnabled = val;
                  });
                },
                activeThumbColor: AppColors.black,
                activeTrackColor: AppColors.black.withValues(alpha: 0.1),
              ),
            ),
            vGap(12.h),
            _buildSettingTile(
              title: "Language",
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<LanguageCubit, LanguageState>(
                    builder: (context, state) {
                      return Text(
                        context.read<LanguageCubit>().locale == 'ar'
                            ? "Arabic"
                            : "English",
                        style: AppTextStyles.font14GrayMedium,
                      );
                    },
                  ),
                  hGap(8.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                    color: AppColors.black.withValues(alpha: 0.3),
                  ),
                ],
              ),
              onTap: () => context.push(LanguageView.routeName),
            ),
            vGap(12.h),
            _buildSettingTile(
              title: "Privacy Policy",
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
                color: AppColors.black.withValues(alpha: 0.3),
              ),
              onTap: () => context.push('/privacy-policy'),
            ),
            vGap(12.h),
            _buildSettingTile(
              title: "Terms of Service",
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
                color: AppColors.black.withValues(alpha: 0.3),
              ),
              onTap: () => context.push('/terms-of-service'),
            ),
            vGap(12.h),
            _buildSettingTile(
              title: "About Us",
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
                color: AppColors.black.withValues(alpha: 0.3),
              ),
              onTap: () => context.push('/about-us'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: AppColors.black.withValues(alpha: 0.05)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.font16BlackBold.copyWith(fontSize: 15.sp),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
