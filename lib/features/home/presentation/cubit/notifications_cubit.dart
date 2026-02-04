import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/home/data/repos/notifications_repo.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_state.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepository _repository;

  NotificationsCubit(this._repository)
    : super(const NotificationsState.initial());

  List<NotificationModel> _notifications = [];

  Future<void> getNotifications() async {
    emit(const NotificationsState.loading());
    final result = await _repository.getNotifications();
    result.when(
      success: (data) {
        _notifications = data;
        emit(NotificationsState.success(_notifications));
      },
      failure: (error) => emit(NotificationsState.error(error)),
    );
  }

  Future<void> markAsRead(String id) async {
    final result = await _repository.markAsRead(id);
    result.when(
      success: (_) {
        _notifications = _notifications.map((n) {
          if (n.id == id) {
            return NotificationModel(
              id: n.id,
              title: n.title,
              body: n.body,
              timestamp: n.timestamp,
              type: n.type,
              isRead: true,
              payload: n.payload,
            );
          }
          return n;
        }).toList();
        emit(NotificationsState.success(_notifications));
      },
      failure: (error) => emit(NotificationsState.error(error)),
    );
  }

  Future<void> clearAll() async {
    final result = await _repository.clearAllNotifications();
    result.when(
      success: (_) {
        _notifications = [];
        emit(NotificationsState.success(_notifications));
      },
      failure: (error) => emit(NotificationsState.error(error)),
    );
  }

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  Future<void> addNotification(NotificationModel notification) async {
    await _repository.addNotification(notification);
    _notifications = [notification, ..._notifications];
    emit(NotificationsState.success(_notifications));
  }
}
