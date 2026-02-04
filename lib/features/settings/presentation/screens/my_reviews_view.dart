import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/products/presentation/cubit/reviews_cubit.dart';
import 'package:flux_store/features/products/presentation/cubit/reviews_state.dart';
import 'package:flux_store/generated/l10n.dart';

class MyReviewsView extends StatefulWidget {
  static const String routeName = '/my-reviews';
  const MyReviewsView({super.key});

  @override
  State<MyReviewsView> createState() => _MyReviewsViewState();
}

class _MyReviewsViewState extends State<MyReviewsView> {
  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    final userName = await SharedPrefHelper.getString("firstName") ?? "Guest";
    if (mounted) {
      context.read<ReviewsCubit>().getUserReviews(userName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      backgroundColor: AppColors.white,
      appBar: CustomBackAppBar(title: s.myReviews),
      body: BlocBuilder<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (reviews) {
              if (reviews.isEmpty) {
                return Center(
                  child: Text(
                    "You haven't written any reviews yet.",
                    style: AppTextStyles.font14GreyRegular,
                  ),
                );
              }
              return ListView.separated(
                padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
                itemCount: reviews.length,
                separatorBuilder: (context, index) => vGap(20.h),
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return _MyReviewCard(
                    rating: review.rating.toInt(),
                    date: review.date,
                    comment: review.content,
                    productName: "Product #${review.productId.substring(0, 5)}",
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class _MyReviewCard extends StatelessWidget {
  final int rating;
  final String date;
  final String comment;
  final String productName;

  const _MyReviewCard({
    required this.rating,
    required this.date,
    required this.comment,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productName, style: AppTextStyles.font14BlackBold),
              Text(date, style: AppTextStyles.font12GrayRegular),
            ],
          ),
          vGap(12.h),
          Row(
            children: List.generate(
              5,
              (i) => Icon(
                Icons.star,
                size: 14.sp,
                color: i < rating ? Colors.amber : AppColors.greyLight,
              ),
            ),
          ),
          vGap(12.h),
          Text(
            comment,
            style: AppTextStyles.font14GrayMedium.copyWith(
              color: AppColors.black.withValues(alpha: 0.7),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
