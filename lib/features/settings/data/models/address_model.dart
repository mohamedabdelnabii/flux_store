import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final int? id;
  final String? name;
  final String? city;
  final String? street;
  final String? phone;
  @JsonKey(name: 'is_default')
  final bool? isDefault;

  AddressModel({
    this.id,
    this.name,
    this.city,
    this.street,
    this.phone,
    this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
