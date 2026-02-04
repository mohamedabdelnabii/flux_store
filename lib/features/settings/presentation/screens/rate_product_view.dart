import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/core/widgets/custom_snack_bar.dart';

class RateProductView extends StatefulWidget {
  static const String routeName = '/rate-product';
  const RateProductView({super.key});

  @override
  State<RateProductView> createState() => _RateProductViewState();
}

class _RateProductViewState extends State<RateProductView> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomBackAppBar(title: "Rate Product"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Container(
              height: 200.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: AppColors.greyLight,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: const Icon(Icons.image_outlined, size: 48),
            ),
            vGap(32.h),
            Text(
              "How do you feel about this product?",
              style: AppTextStyles.font18BlackBold,
              textAlign: TextAlign.center,
            ),
            vGap(24.h),
            _buildStarRating(),
            vGap(32.h),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your review here...",
                hintStyle: AppTextStyles.font14GreyMedium,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColors.greyLight),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColors.greyLight),
                ),
                filled: true,
                fillColor: AppColors.white,
              ),
            ),
            vGap(40.h),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                  CustomSnackBar.show(
                    context,
                    message: "Thank you for your review!",
                    icon: Icons.star,
                    backgroundColor: AppColors.success,
                  );
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                ),
                child: Text(
                  "SUBMIT REVIEW",
                  style: AppTextStyles.font14WhiteBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => setState(() => _rating = index + 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Icon(
              index < _rating ? Icons.star : Icons.star_border,
              color: index < _rating ? Colors.amber : AppColors.grey,
              size: 40.sp,
            ),
          ),
        );
      }),
    );
  }
}
