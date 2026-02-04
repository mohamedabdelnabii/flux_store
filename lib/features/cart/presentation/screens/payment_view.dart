import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/core/widgets/custom_text_button.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flux_store/features/cart/presentation/screens/checkout_success_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import 'package:flux_store/features/addresses/data/models/address_response.dart';
import 'package:flux_store/features/orders/data/models/order_response.dart'
    as order_models;
import 'package:flux_store/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:flux_store/features/orders/presentation/cubit/orders_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flux_store/features/home/presentation/widgets/shimmer/home_shimmer.dart';
import 'package:flux_store/features/addresses/presentation/screens/shipping_addresses_view.dart';

class PaymentView extends StatefulWidget {
  static const String routeName = '/payment';
  final AddressModel selectedAddress;
  const PaymentView({super.key, required this.selectedAddress});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  int selectedPaymentMethod = 1; // 0 for Cash, 1 for Card (Stripe)
  late AddressModel _currentAddress;

  @override
  void initState() {
    super.initState();
    _currentAddress = widget.selectedAddress;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final cartCubit = context.read<CartCubit>();

    return BlocListener<OrdersCubit, OrdersState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => context.showLoadingDialog(),
          error: (error) {
            context.pop(); // Close loading
            context.showErrorSnackBar(error);
          },
          cashOrderSuccess: (order) {
            context.pop(); // Close loading
            cartCubit.clearCart();
            context.push(CheckoutSuccessView.routeName);
          },
          checkoutSessionSuccess: (response) async {
            context.pop(); // Close loading
            if (response.session?.url != null) {
              final url = Uri.parse(response.session!.url!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
                if (!context.mounted) return;
                cartCubit.clearCart();
                context.push(CheckoutSuccessView.routeName);
              } else {
                if (!context.mounted) return;
                context.showErrorSnackBar("Could not launch payment URL");
              }
            }
          },
        );
      },
      child: CustomScaffold(
        appBar: CustomBackAppBar(title: s.checkout),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final double subtotal = state.maybeWhen(
              success: (cartResponse) =>
                  (cartResponse.data?.totalCartPrice ?? 0).toDouble(),
              orElse: () => 0.0,
            );

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressStepper(),
                  vGap(30.h),
                  _buildAddressSection(context),
                  vGap(20.h),
                  Text("Payment", style: AppTextStyles.font16BlackBold),
                  vGap(16.h),
                  _buildCreditCard(),
                  vGap(24.h),
                  _buildPaymentMethods(),
                  vGap(32.h),
                  _buildSummary(subtotal),
                  vGap(40.h),
                  _buildPlaceOrderButton(context, cartCubit),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAddressSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Address", style: AppTextStyles.font16BlackBold),
            TextButton(
              onPressed: () async {
                final result = await context.push(
                  ShippingAddressesView.routeName,
                );
                if (result != null && result is AddressModel) {
                  setState(() {
                    _currentAddress = result;
                  });
                }
              },
              child: Text(
                "Change",
                style: AppTextStyles.font14PrimaryBold.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.greyLight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _currentAddress.name ?? "",
                style: AppTextStyles.font14BlackBold,
              ),
              vGap(4.h),
              Text(
                "${_currentAddress.details}\n${_currentAddress.city}, ${_currentAddress.phone}",
                style: AppTextStyles.font12GrayRegular.copyWith(height: 1.5),
              ),
            ],
          ),
        ),
      ],
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

  Widget _buildCreditCard() {
    return Container(
      height: 190.h,
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2D2E2E), Color(0xFF1A1A1A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "VISA",
                style: AppTextStyles.font18WhiteBold.copyWith(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                ),
              ),
              Icon(Icons.contactless, color: Colors.white, size: 24.sp),
            ],
          ),
          Text(
            "**** **** **** 3947",
            style: AppTextStyles.font24WhiteBold.copyWith(letterSpacing: 2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CARD HOLDER",
                    style: AppTextStyles.font12WhiteBold.copyWith(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                  Text("John Doe", style: AppTextStyles.font14WhiteBold),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EXPIRES",
                    style: AppTextStyles.font12WhiteBold.copyWith(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                  Text("05/24", style: AppTextStyles.font14WhiteBold),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _paymentIcon(0, Icons.money, Colors.green), // Added Cash Option
        _paymentIcon(1, Icons.credit_card, Colors.orange), // Stripe Option
        _paymentIcon(2, Icons.paypal, Colors.indigo),
        _paymentIcon(3, Icons.apple, Colors.black),
      ],
    );
  }

  Widget _paymentIcon(int index, IconData icon, Color color) {
    bool isSelected = selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () => setState(() => selectedPaymentMethod = index),
      child: Container(
        width: 65.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.black.withValues(alpha: 0.05)
              : AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.black : AppColors.greyLight,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Icon(icon, color: color, size: 28.sp),
      ),
    );
  }

  Widget _buildSummary(double subtotal) {
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
        children: [
          _summaryRow("Order", subtotal),
          vGap(12.h),
          _summaryRow("Delivery", 0.00),
          vGap(15.h),
          const Divider(),
          vGap(15.h),
          _summaryRow("Total", subtotal, isTotal: true),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, double amount, {bool isTotal = false}) {
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

  Widget _buildPlaceOrderButton(BuildContext context, CartCubit cartCubit) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: CustomTextButton(
        onTap: () {
          final cartId = cartCubit.cartId;
          if (cartId == null) {
            context.showErrorSnackBar("Cart is empty or not loaded");
            return;
          }

          final shippingAddr = order_models.ShippingAddress(
            details: _currentAddress.details,
            city: _currentAddress.city,
            phone: _currentAddress.phone,
          );

          if (selectedPaymentMethod == 0) {
            context.read<OrdersCubit>().createCashOrder(cartId, shippingAddr);
          } else {
            context.read<OrdersCubit>().createCheckoutSession(
              cartId,
              "https://ecommerce.routemisr.com", // Base URL as success placeholder
              shippingAddr,
            );
          }
        },
        text: "PLACE ORDER",
      ),
    );
  }
}

// Extension helpers for cleaner UI
extension BuildContextExt on BuildContext {
  void showLoadingDialog() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => const Center(child: GenericCircularShimmer()),
    );
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }
}
