import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_response.g.dart';

@JsonSerializable()
class AddressResponse {
  final String? status;
  final String? message;
  @JsonKey(name: 'data')
  final List<AddressModel>? data;

  AddressResponse({this.status, this.message, this.data});

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 8)
class AddressModel {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? details;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final String? city;

  AddressModel({this.id, this.name, this.details, this.phone, this.city});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
