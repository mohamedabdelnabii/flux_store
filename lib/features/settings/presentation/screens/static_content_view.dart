import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';

class StaticContentView extends StatelessWidget {
  final String title;
  final String content;
  const StaticContentView({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.white,
      appBar: CustomBackAppBar(title: title),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Text(
          content,
          style: AppTextStyles.font14BlackMedium.copyWith(
            height: 1.8,
            color: AppColors.black.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
