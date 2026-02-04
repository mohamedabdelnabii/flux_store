import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';
import 'package:flux_store/core/networking/api_error_model.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.loading() = _Loading;
  const factory NotificationsState.success(
    List<NotificationModel> notifications,
  ) = _Success;
  const factory NotificationsState.error(ApiErrorModel apiErrorModel) = _Error;
}
