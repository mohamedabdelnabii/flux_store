import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  final String? status;
  @JsonKey(name: 'numOfCartItems')
  final int? numOfCartItems;
  final String? cartId;
  final CartData? data;

  CartResponse({this.status, this.numOfCartItems, this.cartId, this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@JsonSerializable()
class CartData {
  @JsonKey(name: '_id')
  final String? id;
  final String? cartOwner;
  final List<CartProductItem>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final num? totalCartPrice;

  CartData({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 15)
class CartProductItem {
  @HiveField(0)
  final int? count;
  @JsonKey(name: '_id')
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final CartProductDetails? product;
  @HiveField(3)
  final num? price;

  CartProductItem({this.count, this.id, this.product, this.price});

  factory CartProductItem.fromJson(Map<String, dynamic> json) =>
      _$CartProductItemFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 16)
class CartProductDetails {
  @HiveField(0)
  final List<SubCategoryInCart>? subcategory;
  @JsonKey(name: '_id')
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? imageCover;
  @HiveField(4)
  final CategoryInCart? category;
  @HiveField(5)
  final BrandInCart? brand;
  @HiveField(6)
  final num? ratingsAverage;

  CartProductDetails({
    this.subcategory,
    this.id,
    this.title,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  factory CartProductDetails.fromJson(Map<String, dynamic> json) =>
      _$CartProductDetailsFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 17)
class SubCategoryInCart {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? category;

  SubCategoryInCart({this.id, this.name, this.slug, this.category});

  factory SubCategoryInCart.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryInCartFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 18)
class CategoryInCart {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? image;

  CategoryInCart({this.id, this.name, this.slug, this.image});

  factory CategoryInCart.fromJson(Map<String, dynamic> json) =>
      _$CategoryInCartFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 19)
class BrandInCart {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? slug;
  @HiveField(3)
  final String? image;

  BrandInCart({this.id, this.name, this.slug, this.image});

  factory BrandInCart.fromJson(Map<String, dynamic> json) =>
      _$BrandInCartFromJson(json);
}
