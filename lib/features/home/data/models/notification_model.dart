import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class NotificationModel {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String body;
  @HiveField(3)
  final String timestamp;
  @HiveField(4)
  final String type; // 'order', 'offer', 'wishlist', 'system'
  @HiveField(5)
  final bool isRead;
  @HiveField(6)
  final Map<String, dynamic>? payload;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.type,
    required this.isRead,
    this.payload,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
