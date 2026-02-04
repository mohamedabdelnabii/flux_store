// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistResponse _$WishlistResponseFromJson(Map<String, dynamic> json) =>
    WishlistResponse(
      status: json['status'] as String?,
      count: (json['count'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WishlistResponseToJson(WishlistResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'data': instance.data,
    };
