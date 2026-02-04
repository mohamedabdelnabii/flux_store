import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/products/data/models/review_model.dart';
import 'package:flux_store/features/products/presentation/cubit/reviews_cubit.dart';
import 'package:flux_store/features/products/presentation/cubit/reviews_state.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flux_store/core/widgets/custom_snack_bar.dart';

class ProductReviewsSection extends StatefulWidget {
  final String productId;
  const ProductReviewsSection({super.key, required this.productId});

  @override
  State<ProductReviewsSection> createState() => _ProductReviewsSectionState();
}

class _ProductReviewsSectionState extends State<ProductReviewsSection> {
  int _selectedRating = 5;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.maybeWhen(
              success: (reviews) {
                if (reviews.isEmpty) {
                  return Text(
                    "No reviews yet. Be the first to review!",
                    style: AppTextStyles.font14GreyRegular,
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviews.length,
                  separatorBuilder: (context, index) => vGap(12.h),
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              review.userName,
                              style: AppTextStyles.font14BlackBold,
                            ),
                            const Spacer(),
                            Text(
                              review.date,
                              style: AppTextStyles.font12GrayRegular,
                            ),
                          ],
                        ),
                        vGap(4.h),
                        Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              Icons.star,
                              color: i < review.rating
                                  ? Colors.amber
                                  : AppColors.greyLight,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        vGap(8.h),
                        Text(
                          review.content,
                          style: AppTextStyles.font14GrayMedium,
                        ),
                      ],
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox.shrink(),
            ),
            vGap(24.h),
            Text(s.addReview, style: AppTextStyles.font16BlackBold),
            vGap(12.h),
            Wrap(
              spacing: 8.w,
              children: List.generate(5, (i) {
                final value = 5 - i;
                return _RatingChip(
                  label: '$value ⭐',
                  selected: _selectedRating == value,
                  onTap: () => setState(() => _selectedRating = value),
                );
              }),
            ),
            vGap(12.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.3),
                ),
              ),
              child: TextField(
                controller: _reviewController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Write your review...",
                  border: InputBorder.none,
                  hintStyle: AppTextStyles.font14GrayMedium,
                  contentPadding: EdgeInsets.all(12.w),
                ),
              ),
            ),
            vGap(12.h),
            SizedBox(
              width: 140.w,
              child: CustomTextButton(
                width: 80.w,
                onTap: () async {
                  if (_reviewController.text.isEmpty) {
                    CustomSnackBar.show(
                      context,
                      message: "Please write a review",
                      backgroundColor: AppColors.error,
                    );
                    return;
                  }
                  final userName =
                      await SharedPrefHelper.getString("firstName") ?? "Guest";
                  final review = ReviewModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    productId: widget.productId,
                    userName: userName,
                    content: _reviewController.text,
                    rating: _selectedRating.toDouble(),
                    date: DateTime.now().toString().substring(0, 10),
                  );
                  if (context.mounted) {
                    context.read<ReviewsCubit>().addReview(review);
                    _reviewController.clear();
                    CustomSnackBar.show(
                      context,
                      message: "Review submitted successfully",
                      backgroundColor: AppColors.success,
                    );
                  }
                },
                text: "SUBMIT",
              ),
            ),
          ],
        );
      },
    );
  }
}

class _RatingChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RatingChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryLight : AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: selected
                ? AppColors.primaryLight
                : AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppColors.white : AppColors.black,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
