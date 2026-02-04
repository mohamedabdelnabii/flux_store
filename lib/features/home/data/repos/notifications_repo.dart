import 'package:flux_store/core/networking/api_result.dart';
import 'package:flux_store/core/networking/api_error_model.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';
import 'package:hive/hive.dart';

class NotificationsRepository {
  final Box<NotificationModel> _box;

  NotificationsRepository()
    : _box = Hive.box<NotificationModel>('notifications_box');

  Future<ApiResult<List<NotificationModel>>> getNotifications() async {
    try {
      final notifications = _box.values.toList().reversed.toList();
      return ApiResult.success(notifications);
    } catch (error) {
      return ApiResult.failure(ApiErrorModel(message: error.toString()));
    }
  }

  Future<ApiResult<void>> markAsRead(String id) async {
    try {
      final notification = _box.get(id);
      if (notification != null) {
        await _box.put(
          id,
          NotificationModel(
            id: notification.id,
            title: notification.title,
            body: notification.body,
            timestamp: notification.timestamp,
            type: notification.type,
            isRead: true,
            payload: notification.payload,
          ),
        );
      }
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorModel(message: error.toString()));
    }
  }

  Future<ApiResult<void>> clearAllNotifications() async {
    try {
      await _box.clear();
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorModel(message: error.toString()));
    }
  }

  Future<ApiResult<void>> addNotification(
    NotificationModel notification,
  ) async {
    try {
      await _box.put(notification.id, notification);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(error.toString() as dynamic);
    }
  }
}
