import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/widgets/custom_header_with_icon.dart';
import 'package:flux_store/features/home/presentation/screens/notifications_view.dart';
import 'package:flux_store/features/home/presentation/screens/menu_view.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_cubit.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_state.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SliverAppBar(
      toolbarHeight: 80.h,
      title: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          final unreadCount = context.read<NotificationsCubit>().unreadCount;
          return CustomHeaderWithIconOrNot(
            title: s.gemStore,
            onTapR: () {
              context.push(MenuView.routeName);
            },
            onTapL: () {
              GoRouter.of(context).push(NotificationsView.routeName);
            },
            iconR: Icons.menu_outlined,
            iconL: Icons.notifications_none_outlined,
            showBadge: unreadCount > 0,
            badgeCount: unreadCount,
          );
        },
      ),
    );
  }
}
