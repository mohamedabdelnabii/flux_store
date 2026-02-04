import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/features/auth/presentation/screens/Login_view.dart';
import 'package:flux_store/features/settings/presentation/screens/my_orders_view.dart';
import 'package:flux_store/features/settings/presentation/screens/payment_methods_view.dart';
import 'package:flux_store/features/settings/presentation/screens/my_reviews_view.dart';
import 'package:flux_store/features/settings/presentation/screens/settings_view.dart';
import 'package:flux_store/features/addresses/presentation/screens/shipping_addresses_view.dart';
import 'package:flux_store/features/wishlist/presentation/screens/wishlist_view.dart';
import 'package:flux_store/features/settings/presentation/widgets/profile_header.dart';
import 'package:flux_store/features/settings/presentation/widgets/profile_option_tile.dart';
import 'package:flux_store/features/settings/presentation/screens/voucher_view.dart';
import 'package:flux_store/features/settings/presentation/screens/change_password_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          const ProfileHeader(),
          vGap(32.h),
          ProfileOptionTile(
            icon: Icons.shopping_bag_outlined,
            title: s.myOrders,
            onTap: () {
              context.push(MyOrdersView.routeName);
            },
          ),
          ProfileOptionTile(
            icon: Icons.location_on_outlined,
            title: s.shippingAddresses,
            onTap: () {
              context.push(ShippingAddressesView.routeName);
            },
          ),
          ProfileOptionTile(
            icon: Icons.payment_outlined,
            title: s.paymentMethods,
            onTap: () {
              context.push(PaymentMethodsView.routeName);
            },
          ),
          ProfileOptionTile(
            icon: Icons.star_border,
            title: s.myReviews,
            onTap: () {
              context.push(MyReviewsView.routeName);
            },
          ),
          ProfileOptionTile(
            icon: Icons.favorite_border,
            title: s.wishlist,
            onTap: () {
              context.push(WishlistView.routeName);
            },
          ),
          ProfileOptionTile(
            icon: Icons.confirmation_number_outlined,
            title: "Vouchers",
            onTap: () {
              context.push(VoucherView.routeName);
            },
          ),
          ProfileOptionTile(
            icon: Icons.settings_outlined,
            title: s.settings,
            onTap: () {
              context.push(SettingsView.routeName);
            },
          ),
          ProfileOptionTile(
            icon: Icons.lock_outline,
            title: "Change Password",
            onTap: () {
              context.push(ChangePasswordView.routeName);
            },
          ),
          vGap(16.h),
          ProfileOptionTile(
            icon: Icons.logout,
            title: s.logOut,
            isDestructive: true,
            onTap: () async {
              await SharedPrefHelper.clearAllSecuredData();
              if (context.mounted) {
                context.go(LoginView.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
