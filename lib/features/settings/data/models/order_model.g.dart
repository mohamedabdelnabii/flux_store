// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      date: json['date'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      orderNumber: json['order_number'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'date': instance.date,
      'total': instance.total,
      'order_number': instance.orderNumber,
    };
