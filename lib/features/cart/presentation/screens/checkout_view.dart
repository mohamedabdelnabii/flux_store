import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:flux_store/features/addresses/presentation/cubit/addresses_cubit.dart';
import 'package:flux_store/features/addresses/presentation/cubit/addresses_state.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart'
    as cart_logic;
import 'package:flux_store/features/cart/presentation/screens/payment_view.dart';
import 'package:flux_store/features/addresses/presentation/screens/shipping_addresses_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/core/widgets/custom_snack_bar.dart';

class CheckoutView extends StatefulWidget {
  static const String routeName = '/checkout';
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  AddressModel? selectedAddress;

  @override
  void initState() {
    super.initState();
    context.read<AddressesCubit>().getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      appBar: CustomBackAppBar(title: s.checkout),
      body: BlocBuilder<AddressesCubit, AddressesState>(
        builder: (context, addressState) {
          // Set initial address if none selected
          if (selectedAddress == null) {
            final resp = addressState.addressResponse;
            if (resp != null && resp.data?.isNotEmpty == true) {
              selectedAddress = resp.data![0];
            }
          }

          return BlocBuilder<cart_logic.CartCubit, cart_logic.CartState>(
            builder: (context, cartState) {
              return _buildBody(context, s, addressState, cartState);
            },
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    S s,
    AddressesState addressState,
    cart_logic.CartState cartState,
  ) {
    final cartResponse = cartState.cartResponse;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressStepper(),
          vGap(30.h),
          _buildSection(
            context,
            title: "Shipping Address",
            content: selectedAddress != null
                ? "${selectedAddress!.name}\n${selectedAddress!.details}\n${selectedAddress!.city}"
                : "No address selected",
            onTap: () async {
              final result = await context.push(
                ShippingAddressesView.routeName,
              );
              if (result is AddressModel) {
                setState(() => selectedAddress = result);
              }
            },
          ),
          vGap(24.h),
          _buildSection(
            context,
            title: "Delivery Method",
            content: "Standard Delivery",
            onTap: () {},
            icon: Icons.local_shipping_outlined,
          ),
          vGap(40.h),

          // Order Summary
          Container(
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
              children: [
                _buildSummaryRow(
                  "Order",
                  (cartResponse?.data?.totalCartPrice ?? 0).toDouble(),
                ),
                vGap(12.h),
                _buildSummaryRow("Delivery", 0.00),
                vGap(15.h),
                const Divider(),
                vGap(15.h),
                _buildSummaryRow(
                  "Total",
                  (cartResponse?.data?.totalCartPrice ?? 0).toDouble(),
                  isTotal: true,
                ),
              ],
            ),
          ),
          vGap(40.h),

          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: CustomTextButton(
              onTap: () {
                if (selectedAddress == null) {
                  CustomSnackBar.show(
                    context,
                    message: "Please select a shipping address",
                    icon: Icons.location_off,
                    backgroundColor: AppColors.error,
                  );
                  return;
                }
                context.push(PaymentView.routeName, extra: selectedAddress);
              },
              text: "CONTINUE TO PAYMENT",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _stepperCircle(true),
        _stepperLine(true),
        _stepperCircle(true),
        _stepperLine(true),
        _stepperCircle(true),
      ],
    );
  }

  Widget _stepperCircle(bool filled) {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? AppColors.black : AppColors.greyLight,
      ),
    );
  }

  Widget _stepperLine(bool filled) {
    return Container(
      width: 60.w,
      height: 2.h,
      color: filled ? AppColors.black : AppColors.greyLight,
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onTap,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font16BlackBold),
        vGap(12.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: AppColors.black, size: 24.sp),
                  hGap(16.w),
                ],
                Expanded(
                  child: Text(
                    content,
                    style: AppTextStyles.font14GrayMedium.copyWith(
                      color: AppColors.black.withValues(alpha: 0.7),
                    ),
                  ),
                ),
                Text(
                  "Change",
                  style: AppTextStyles.font14PrimaryBold.copyWith(
                    color: AppColors.error,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.font16BlackBold
              : AppTextStyles.font14GreyMedium,
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: isTotal
              ? AppTextStyles.font18PrimaryBold.copyWith(color: AppColors.black)
              : AppTextStyles.font16BlackBold,
        ),
      ],
    );
  }
}
