import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flux_store/features/cart/data/models/cart_response.dart';

part 'order_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 11)
class OrdersResponse {
  @HiveField(0)
  final String? status;
  @JsonKey(name: 'data')
  @HiveField(1)
  final List<OrderModel>? data;

  OrdersResponse({this.status, this.data});

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 12)
class OrderModel {
  @HiveField(0)
  final ShippingAddress? shippingAddress;
  @JsonKey(name: '_id')
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final UserInOrder? user;
  @HiveField(3)
  final List<CartProductItem>? cartItems;
  @HiveField(4)
  final int? totalOrderPrice;
  @HiveField(5)
  final String? paymentMethodType;
  @HiveField(6)
  final bool? isPaid;
  @HiveField(7)
  final bool? isDelivered;
  @HiveField(8)
  final DateTime? createdAt;
  @HiveField(9)
  final DateTime? updatedAt;
  @HiveField(10)
  final int? idNumber;

  OrderModel({
    this.shippingAddress,
    this.id,
    this.user,
    this.cartItems,
    this.totalOrderPrice,
    this.paymentMethodType,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
    this.idNumber,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 13)
class ShippingAddress {
  @HiveField(0)
  final String? details;
  @HiveField(1)
  final String? phone;
  @HiveField(2)
  final String? city;

  ShippingAddress({this.details, this.phone, this.city});

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 14)
class UserInOrder {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? phone;

  UserInOrder({this.id, this.name, this.email, this.phone});

  factory UserInOrder.fromJson(Map<String, dynamic> json) =>
      _$UserInOrderFromJson(json);
}
