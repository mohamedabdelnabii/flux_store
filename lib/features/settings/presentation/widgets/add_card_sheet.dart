import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/core/widgets/custom_text_form_field.dart';
import 'package:flux_store/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flux_store/features/settings/data/models/payment_card_model.dart';
import 'package:flux_store/core/widgets/custom_snack_bar.dart';
import 'package:flux_store/generated/l10n.dart';

class AddCardSheet extends StatefulWidget {
  const AddCardSheet({super.key});

  @override
  State<AddCardSheet> createState() => _AddCardSheetState();
}

class _AddCardSheetState extends State<AddCardSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state.error != null) {
          CustomSnackBar.show(
            context,
            message: state.error!,
            backgroundColor: AppColors.error,
            icon: Icons.error_outline,
          );
        } else if (!state.isCardsLoading) {
          // Successfully added card
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    controller: _nameController,
                    hintText: s.cardHolderName,
                    textInputType: TextInputType.name,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Enter name";
                      }
                      return null;
                    },
                  ),
                  vGap(16.h),
                  CustomTextFormField(
                    controller: _numberController,
                    hintText: s.cardNumber,
                    textInputType: TextInputType.number,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Enter card number";
                      }
                      if (val.length < 16) {
                        return "Invalid card number";
                      }
                      return null;
                    },
                  ),
                  vGap(16.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _expiryController,
                          hintText: s.expiryDate,
                          textInputType: TextInputType.datetime,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter expiry";
                            }
                            return null;
                          },
                        ),
                      ),
                      hGap(16.w),
                      Expanded(
                        child: CustomTextFormField(
                          controller: _cvvController,
                          hintText: s.cvv,
                          textInputType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter CVV";
                            }
                            if (val.length < 3) {
                              return "Invalid";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  vGap(32.h),
                  CustomTextButton(
                    text: state.isCardsLoading ? "SAVING..." : s.save,
                    onTap: state.isCardsLoading
                        ? () {}
                        : () {
                            if (_formKey.currentState!.validate()) {
                              final card = PaymentCardModel(
                                cardHolderName: _nameController.text,
                                cardNumber: _numberController.text,
                                expiryDate: _expiryController.text,
                                cvv: _cvvController.text,
                              );
                              context.read<SettingsCubit>().addCard(card);
                            }
                          },
                  ),
                  vGap(MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
