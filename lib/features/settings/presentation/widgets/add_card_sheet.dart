import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/core/widgets/custom_text_form_field.dart';
import 'package:flux_store/generated/l10n.dart';

class AddCardSheet extends StatelessWidget {
  const AddCardSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 60.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            vGap(24.h),
            Text(s.addNewCard, style: AppTextStyles.font18BlackBold),
            vGap(24.h),
            CustomTextFormField(
              hintText: s.cardHolderName,
              textInputType: TextInputType.name,
              validator: (val) {
                return null;
              },
            ),
            vGap(16.h),
            CustomTextFormField(
              hintText: s.cardNumber,
              textInputType: TextInputType.number,
              validator: (val) {
                return null;
              },
            ),
            vGap(16.h),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: s.expiryDate,
                    textInputType: TextInputType.datetime,
                    validator: (val) {
                      return null;
                    },
                  ),
                ),
                hGap(16.w),
                Expanded(
                  child: CustomTextFormField(
                    hintText: s.cvv,
                    textInputType: TextInputType.number,
                    validator: (val) {
                      return null;
                    },
                  ),
                ),
              ],
            ),
            vGap(32.h),
            CustomTextButton(
              text: s.save,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            vGap(MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}
