import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/di/dependency_injection.dart';
import 'package:flux_store/core/helpers/spacing.dart';
import 'package:flux_store/core/theme/app_colors.dart';
import 'package:flux_store/core/theme/app_text_styles.dart';
import 'package:flux_store/core/widgets/custom_back_app_bar.dart';
import 'package:flux_store/core/widgets/custom_scaffold.dart';
import 'package:flux_store/core/widgets/custom_empty_state.dart';
import 'package:flux_store/core/widgets/custom_error_state.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_cubit.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_state.dart';
import 'package:flux_store/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/core/helpers/notification_logic_helper.dart';

class NotificationsView extends StatelessWidget {
  static const String routeName = '/notifications';
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomScaffold(
      backgroundColor: AppColors.white,
      appBar: CustomBackAppBar(
        title: s.notifications,
        actions: [
          IconButton(
            onPressed: () => getIt<NotificationsCubit>().clearAll(),
            icon: const Icon(
              Icons.delete_sweep_outlined,
              color: AppColors.primaryLight,
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          final isLoading = state.isLoading;
          final notifications = state.notifications;
          final error = state.error;

          if (error != null && notifications == null) {
            return CustomErrorState(
              title: s.errorOccurred,
              subtitle: error.message ?? s.errorOccurred,
              onRetry: () =>
                  context.read<NotificationsCubit>().getNotifications(),
            );
          }

          if (isLoading && notifications == null) {
            return _buildNotificationsList(
              context,
              _dummyNotifications,
              isLoading: true,
            );
          }

          if (notifications == null || notifications.isEmpty) {
            return CustomEmptyState(
              title: s.noNotifications,
              subtitle: s.noNotificationsMessage,
            );
          }

          return _buildNotificationsList(context, notifications);
        },
      ),
    );
  }

  Widget _buildNotificationsList(
    BuildContext context,
    List<NotificationModel> notifications, {
    bool isLoading = false,
  }) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => vGap(16.h),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return GestureDetector(
            onTap: () {
              if (!notification.isRead) {
                context.read<NotificationsCubit>().markAsRead(notification.id);
              }
              if (notification.payload != null) {
                NotificationLogicHelper.handleNotificationNavigation(
                  GoRouter.of(context),
                  notification.payload!,
                );
              }
            },
            child: _NotificationItem(notification: notification),
          );
        },
      ),
    );
  }

  static final List<NotificationModel> _dummyNotifications = List.generate(
    6,
    (index) => NotificationModel(
      id: index.toString(),
      title: "Order Arrived",
      body: "Your order has been delivered successfully.",
      timestamp: "10:30 AM",
      type: "order",
      isRead: index > 2,
    ),
  );
}

class _NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const _NotificationItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    final bool isUnread = !notification.isRead;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isUnread
            ? AppColors.greyLight.withValues(alpha: 0.5)
            : AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isUnread
            ? null
            : [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
        border: Border.all(
          color: isUnread
              ? AppColors.black.withValues(alpha: 0.05)
              : AppColors.transparent,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: isUnread ? AppColors.greyDark : AppColors.greyLight,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getIcon(notification.type),
              size: 20.sp,
              color: isUnread ? AppColors.primaryLight : AppColors.primaryDark,
            ),
          ),
          hGap(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.title,
                      style: AppTextStyles.font14BlackBold,
                    ),
                    Text(
                      notification.timestamp,
                      style: AppTextStyles.font12GrayRegular.copyWith(
                        color: AppColors.black.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
                vGap(6.h),
                Text(
                  notification.body,
                  style: AppTextStyles.font14GrayMedium.copyWith(
                    color: AppColors.black.withValues(alpha: 0.6),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (isUnread) ...[
            hGap(8.w),
            Container(
              width: 8.w,
              height: 8.w,
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getIcon(String type) {
    switch (type) {
      case 'order':
        return Icons.shopping_bag_outlined;
      case 'offer':
        return Icons.local_offer_outlined;
      case 'wishlist':
        return Icons.favorite_border_outlined;
      default:
        return Icons.notifications_none_outlined;
    }
  }
}
