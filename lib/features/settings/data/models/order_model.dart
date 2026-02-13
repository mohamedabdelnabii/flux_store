import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrdersResponse {
  final String? status;
  final int? results;
  final List<OrderModel>? data;

  OrdersResponse({this.status, this.results, this.data});

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);
}

@JsonSerializable()
class OrderModel {
  @JsonKey(name: '_id')
  final String? id;
  final int? shippingPrice;
  final int? taxPrice;
  final int? totalOrderPrice;
  final String? paymentMethodType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final ShippingAddress? shippingAddress;
  final List<CartItem>? cartItems;
  final User? user;

  OrderModel({
    this.id,
    this.shippingPrice,
    this.taxPrice,
    this.totalOrderPrice,
    this.paymentMethodType,
    this.isPaid,
    this.isDelivered,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.shippingAddress,
    this.cartItems,
    this.user,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@JsonSerializable()
class ShippingAddress {
  final String? details;
  final String? phone;
  final String? city;

  ShippingAddress({this.details, this.phone, this.city});

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);
}

@JsonSerializable()
class CartItem {
  @JsonKey(name: '_id')
  final String? id;
  final int? count;
  final ProductInOrder? product;
  final int? price;

  CartItem({this.id, this.count, this.product, this.price});

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@JsonSerializable()
class ProductInOrder {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? imageCover;

  ProductInOrder({this.id, this.title, this.imageCover});

  factory ProductInOrder.fromJson(Map<String, dynamic> json) =>
      _$ProductInOrderFromJson(json);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
