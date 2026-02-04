// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      isDefault: json['is_default'] as bool?,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'street': instance.street,
      'phone': instance.phone,
      'is_default': instance.isDefault,
    };
