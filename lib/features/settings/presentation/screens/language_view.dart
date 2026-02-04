import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/cubit/language/language_cubit.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/generated/l10n.dart';

class LanguageView extends StatelessWidget {
  static const String routeName = '/language';
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      backgroundColor: AppColors.white,
      appBar: CustomBackAppBar(title: s.language),
      body: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          final isArabic = context.read<LanguageCubit>().isArabic ?? true;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                _buildLanguageTile(
                  context,
                  title: s.arabic,
                  isSelected: isArabic,
                  onTap: () {
                    if (!isArabic) {
                      context.read<LanguageCubit>().toggleLanguage();
                    }
                  },
                ),
                vGap(16.h),
                _buildLanguageTile(
                  context,
                  title: s.english,
                  isSelected: !isArabic,
                  onTap: () {
                    if (isArabic) {
                      context.read<LanguageCubit>().toggleLanguage();
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLanguageTile(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.black : AppColors.greyLight,
            width: isSelected ? 1.5.w : 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: isSelected
                  ? AppTextStyles.font16BlackBold
                  : AppTextStyles.font16BlackMedium,
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}
