import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  final int? results;
  @JsonKey(name: 'data')
  final List<ProductModel>? data;

  ProductResponse({this.results, this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@JsonSerializable()
class SingleProductResponse {
  @JsonKey(name: 'data')
  final ProductModel? data;

  SingleProductResponse({this.data});

  factory SingleProductResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleProductResponseFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 2)
class ProductModel {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final int? quantity;
  @HiveField(5)
  final int? price;
  @HiveField(6)
  final String? imageCover;
  @HiveField(7)
  final List<String>? images;
  @HiveField(8)
  final CategoryModelInProduct? category;
  @JsonKey(name: 'subcategory')
  @HiveField(9)
  final List<SubcategoryModel>? subcategory;
  @HiveField(10)
  final BrandModelInProduct? brand;
  @HiveField(11)
  final num? ratingsAverage;
  @HiveField(12)
  final int? ratingsQuantity;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.images,
    this.category,
    this.subcategory,
    this.brand,
    this.ratingsAverage,
    this.ratingsQuantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 4)
class SubcategoryModel {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? category;

  SubcategoryModel({this.id, this.name, this.slug, this.category});

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryModelFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 5)
class CategoryModelInProduct {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? image;

  CategoryModelInProduct({this.id, this.name, this.slug, this.image});

  factory CategoryModelInProduct.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelInProductFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 6)
class BrandModelInProduct {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? image;

  BrandModelInProduct({this.id, this.name, this.slug, this.image});

  factory BrandModelInProduct.fromJson(Map<String, dynamic> json) =>
      _$BrandModelInProductFromJson(json);
}
