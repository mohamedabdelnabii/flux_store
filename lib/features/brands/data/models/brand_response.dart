import 'package:json_annotation/json_annotation.dart';

part 'brand_response.g.dart';

@JsonSerializable()
class BrandResponse {
  final int? results;
  @JsonKey(name: 'data')
  final List<BrandModel>? data;

  BrandResponse({this.results, this.data});

  factory BrandResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseFromJson(json);
}

@JsonSerializable()
class BrandModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  BrandModel({this.id, this.name, this.slug, this.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}
