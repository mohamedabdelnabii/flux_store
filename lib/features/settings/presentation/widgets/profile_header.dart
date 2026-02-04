import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/app_assets.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flux_store/features/settings/presentation/screens/profile_detail_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import 'package:flux_store/features/settings/presentation/widgets/settings_shimmer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is Loading) {
          return const ProfileHeaderShimmer();
        }

        final userData = state.whenOrNull(
          profileSuccess: (userData) => userData,
        );

        return GestureDetector(
          onTap: () {
            context.push(ProfileDetailView.routeName);
          },
          child: Row(
            children: [
              Container(
                width: 70.w,
                height: 70.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      Assets.imagesPngCollection,
                    ), // Placeholder avatar
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              hGap(16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData?.name ?? S.of(context).userName,
                      style: AppTextStyles.font18BlackBold,
                    ),
                    vGap(4.h),
                    Text(
                      userData?.email ?? S.of(context).userEmail,
                      style: AppTextStyles.font14GreyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
