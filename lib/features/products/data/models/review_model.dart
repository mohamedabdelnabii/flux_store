import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 50)
class ReviewModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String productId;
  @HiveField(2)
  final String userName;
  @HiveField(3)
  final String content;
  @HiveField(4)
  final double rating;
  @HiveField(5)
  final String date;

  ReviewModel({
    required this.id,
    required this.productId,
    required this.userName,
    required this.content,
    required this.rating,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
