import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/auth/data/models/auth_response.dart';
import 'package:flux_store/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flux_store/features/settings/presentation/widgets/settings_shimmer.dart';

class ProfileDetailView extends StatefulWidget {
  static const String routeName = '/profile-detail';
  const ProfileDetailView({super.key});

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  @override
  void initState() {
    super.initState();
    // Fetch profile data on view load
    context.read<SettingsCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomBackAppBar(title: "Profile Details"),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const AddressesShimmer(),
            profileSuccess: (user) => _buildProfileContent(context, user),
            ordersSuccess: (_) => const SizedBox.shrink(),
            addressesSuccess: (_) => const SizedBox.shrink(),
            error: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64.sp,
                    color: AppColors.error,
                  ),
                  vGap(16.h),
                  Text(
                    "Failed to load profile",
                    style: AppTextStyles.font16BlackBold,
                  ),
                  vGap(8.h),
                  Text(
                    error,
                    style: AppTextStyles.font14GreyRegular,
                    textAlign: TextAlign.center,
                  ),
                  vGap(24.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SettingsCubit>().getProfile();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: Text("Retry", style: AppTextStyles.font14WhiteBold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, UserData user) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          _buildInfoTile(context, "Name", user.name ?? "N/A"),
          vGap(16.h),
          _buildInfoTile(context, "Email", user.email ?? "N/A"),
          vGap(16.h),
          _buildInfoTile(context, "Role", user.role ?? "User"),
        ],
      ),
    );
  }

  Widget _buildInfoTile(BuildContext context, String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.greyLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.font14GreyMedium),
          vGap(8.h),
          Text(value, style: AppTextStyles.font16BlackBold),
        ],
      ),
    );
  }
}
