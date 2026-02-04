import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/widgets/custom_header_with_icon.dart';
import 'package:flux_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/features/cart/presentation/widgets/cart_item.dart';
import 'package:flux_store/features/cart/presentation/widgets/cart_summary.dart';
import 'package:flux_store/features/cart/presentation/widgets/checkout_button.dart';

import 'package:flux_store/features/cart/presentation/screens/checkout_view.dart';
import 'package:flux_store/features/home/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import 'package:flux_store/features/cart/presentation/widgets/cart_shimmer.dart';
import 'package:flux_store/features/home/presentation/screens/bottom_nav_bar_view.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        CustomHeaderWithIconOrNot(title: s.myCart),
        Expanded(
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return state.maybeWhen(
                success: (cartResponse) =>
                    _buildCartList(context, cartResponse, s),
                initial: () => _buildEmptyCart(s, context),
                loading: () => const CartShimmer(),
                error: (error) => Center(
                  child: Text(error.isNotEmpty ? error : s.errorOccurred),
                ),
                orElse: () => _buildEmptyCart(s, context),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyCart(S s, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80.sp,
            color: AppColors.grey,
          ),
          vGap(16.h),
          Text(s.emptyCart, style: AppTextStyles.font16GreyMedium),
          vGap(24.h),
          SizedBox(
            width: 200.w,
            child: ElevatedButton(
              onPressed: () {
                context.read<BottomNavBarCubit>().changeIndex(0);
                context.go(BottomNavBarView.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                s.continueShopping,
                style: AppTextStyles.font14WhiteBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(BuildContext context, CartResponse cartResponse, S s) {
    final cartCubit = context.read<CartCubit>();
    final items = cartResponse.data?.products ?? [];

    if (items.isEmpty) return _buildEmptyCart(s, context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return CartItemWidget(
                item: item,
                onIncrement: () => cartCubit.updateQuantity(
                  item.product?.id ?? '',
                  (item.count ?? 0) + 1,
                ),
                onDecrement: () => cartCubit.updateQuantity(
                  item.product?.id ?? '',
                  (item.count ?? 0) - 1,
                ),
                onDelete: () =>
                    cartCubit.removeFromCart(item.product?.id ?? ''),
              );
            },
          ),

          CartSummaryWidget(
            subtotal: (cartResponse.data?.totalCartPrice ?? 0).toDouble(),
            shipping: 10.0,
          ),
          vGap(32.h),
          CheckoutButton(
            onTap: () {
              context.push(CheckoutView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
