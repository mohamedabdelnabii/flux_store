import 'package:dio/dio.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/home/data/models/notification_model.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class NotificationsApiService {
  factory NotificationsApiService(Dio dio, {String baseUrl}) =
      _NotificationsApiService;

  @GET('/api/v1/notifications')
  Future<List<NotificationModel>> getNotifications();

  @PATCH('/api/v1/notifications/{id}/read')
  Future<void> markAsRead(@Path("id") String id);

  @DELETE('/api/v1/notifications/clear')
  Future<void> clearAllNotifications();

  @POST('/api/v1/users/fcm-token')
  Future<void> registerFcmToken(@Body() Map<String, dynamic> body);
}
