// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutSessionResponse _$CheckoutSessionResponseFromJson(
        Map<String, dynamic> json) =>
    CheckoutSessionResponse(
      status: json['status'] as String?,
      session: json['session'] == null
          ? null
          : SessionData.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutSessionResponseToJson(
        CheckoutSessionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'session': instance.session,
    };

SessionData _$SessionDataFromJson(Map<String, dynamic> json) => SessionData(
      url: json['url'] as String?,
      successUrl: json['successUrl'] as String?,
      cancelUrl: json['cancelUrl'] as String?,
    );

Map<String, dynamic> _$SessionDataToJson(SessionData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'successUrl': instance.successUrl,
      'cancelUrl': instance.cancelUrl,
    };
