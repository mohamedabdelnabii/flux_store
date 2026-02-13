import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flux_store/features/settings/presentation/widgets/add_card_sheet.dart';
import 'package:flux_store/generated/l10n.dart';

class PaymentMethodsView extends StatefulWidget {
  static const String routeName = '/payment-methods';
  const PaymentMethodsView({super.key});

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getCards();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      appBar: CustomBackAppBar(title: s.paymentMethods),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cards = state.cards ?? [];

          return Stack(
            children: [
              if (state.isCardsLoading && cards.isEmpty)
                const Center(child: CircularProgressIndicator())
              else if (cards.isEmpty)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.credit_card_off,
                        size: 64.sp,
                        color: AppColors.grey,
                      ),
                      vGap(16.h),
                      Text(
                        "No payment methods added yet",
                        style: AppTextStyles.font16BlackBold.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              else
                ListView.builder(
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    final bool isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: index == 0 ? AppColors.black : AppColors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isSelected && index != 0
                                ? AppColors.black
                                : isSelected && index == 0
                                ? AppColors.white.withValues(alpha: 0.5)
                                : AppColors.greyLight,
                            width: 2.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.1),
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
                                Icon(
                                  Icons.credit_card,
                                  color: index == 0
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle,
                                    color: index == 0
                                        ? AppColors.white
                                        : AppColors.black,
                                    size: 24.sp,
                                  ),
                              ],
                            ),
                            vGap(30.h),
                            Text(
                              "**** **** **** ${card.cardNumber.length > 4 ? card.cardNumber.substring(card.cardNumber.length - 4) : card.cardNumber}",
                              style:
                                  (index == 0
                                          ? AppTextStyles.font24WhiteBold
                                          : AppTextStyles.font24BlackBold)
                                      .copyWith(letterSpacing: 2),
                            ),
                            vGap(30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Card Holder",
                                      style: AppTextStyles.font12GrayRegular
                                          .copyWith(
                                            color: index == 0
                                                ? Colors.white70
                                                : Colors.black54,
                                          ),
                                    ),
                                    Text(
                                      card.cardHolderName,
                                      style: index == 0
                                          ? AppTextStyles.font14WhiteBold
                                          : AppTextStyles.font14BlackBold,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Expiry Date",
                                      style: AppTextStyles.font12GrayRegular
                                          .copyWith(
                                            color: index == 0
                                                ? Colors.white70
                                                : Colors.black54,
                                          ),
                                    ),
                                    Text(
                                      card.expiryDate,
                                      style: index == 0
                                          ? AppTextStyles.font14WhiteBold
                                          : AppTextStyles.font14BlackBold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              Positioned(
                bottom: 20.h,
                left: 20.w,
                right: 20.w,
                child: SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.r),
                      ),
                    ),
                    onPressed: () {
                      final cubit = context.read<SettingsCubit>();
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => BlocProvider.value(
                          value: cubit,
                          child: const AddCardSheet(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: AppColors.white, size: 20.sp),
                        hGap(8.w),
                        Text(
                          "ADD NEW CARD",
                          style: AppTextStyles.font14WhiteBold.copyWith(
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
