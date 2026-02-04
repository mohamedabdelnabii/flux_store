import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/features/home/presentation/screens/notifications_view.dart';
import 'package:flux_store/features/settings/presentation/screens/my_orders_view.dart';
import 'package:flux_store/features/wishlist/presentation/screens/wishlist_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class MenuView extends StatelessWidget {
  static const String routeName = '/menu';
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close Button
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.close, color: AppColors.black),
                  ),
                ),
              ),
              vGap(40.h),

              // Menu Items
              _MenuItem(title: s.home, onTap: () => context.pop()),
              _MenuItem(
                title: s.discover,
                onTap: () {
                  context.pop();
                  // Dispatch index change if needed or just navigate
                  // Since it's in a BottomNavBar, we might need a different approach
                  // but for now let's just close or navigate to a specific view if applicable.
                },
              ),
              _MenuItem(
                title: s.myOrders,
                onTap: () {
                  context.pop();
                  context.push(MyOrdersView.routeName);
                },
              ),
              _MenuItem(
                title: s.wishlist,
                onTap: () {
                  context.pop();
                  context.push(WishlistView.routeName);
                },
              ),
              _MenuItem(
                title: s.notifications,
                onTap: () {
                  context.pop();
                  context.push(NotificationsView.routeName);
                },
              ),

              const Spacer(),

              // Logout or Settings at bottom
              _MenuItem(
                title: s.settings,
                onTap: () {
                  context.pop();
                  // Navigate to settings tab/view
                },
              ),
              vGap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MenuItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: AppTextStyles.font24BlackBold.copyWith(fontSize: 22.sp),
        ),
      ),
    );
  }
}
