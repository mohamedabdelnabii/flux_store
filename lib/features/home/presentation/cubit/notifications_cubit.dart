import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/home/data/repos/notifications_repo.dart';
import 'package:flux_store/features/home/presentation/cubit/notifications_state.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepository _repository;

  NotificationsCubit(this._repository) : super(const NotificationsState());

  List<NotificationModel> get _notifications => state.notifications ?? [];

  Future<void> getNotifications() async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _repository.getNotifications();
    result.when(
      success: (data) {
        emit(state.copyWith(isLoading: false, notifications: data));
      },
      failure: (error) => emit(state.copyWith(isLoading: false, error: error)),
    );
  }

  Future<void> markAsRead(String id) async {
    final result = await _repository.markAsRead(id);
    result.when(
      success: (_) {
        final updatedList = _notifications.map((n) {
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
        emit(state.copyWith(notifications: updatedList));
      },
      failure: (error) => emit(state.copyWith(error: error)),
    );
  }

  Future<void> clearAll() async {
    final result = await _repository.clearAllNotifications();
    result.when(
      success: (_) {
        emit(state.copyWith(notifications: []));
      },
      failure: (error) => emit(state.copyWith(error: error)),
    );
  }

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  Future<void> addNotification(NotificationModel notification) async {
    await _repository.addNotification(notification);
    final updatedList = [notification, ..._notifications];
    emit(state.copyWith(notifications: updatedList));
  }
}
