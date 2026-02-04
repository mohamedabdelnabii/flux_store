// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_me_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMeRequestBody _$UpdateMeRequestBodyFromJson(Map<String, dynamic> json) =>
    UpdateMeRequestBody(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UpdateMeRequestBodyToJson(
        UpdateMeRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
