import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class CartItemModel {
  @HiveField(0)
  final String id;
  @JsonKey(name: 'product_id')
  @HiveField(1)
  final String productId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final String? size;
  @HiveField(6)
  final String? color;
  @HiveField(7)
  final int quantity;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    this.size,
    this.color,
    this.quantity = 1,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  CartItemModel copyWith({
    String? id,
    String? productId,
    String? name,
    String? image,
    double? price,
    String? size,
    String? color,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      size: size ?? this.size,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
    );
  }
}
