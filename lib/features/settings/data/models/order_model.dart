import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final int? id;
  final String? status;
  final String? date;
  final double? total;
  @JsonKey(name: 'order_number')
  final String? orderNumber;

  OrderModel({this.id, this.status, this.date, this.total, this.orderNumber});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
