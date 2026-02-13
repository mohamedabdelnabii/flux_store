// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      status: json['status'] as String?,
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['_id'] as String?,
      shippingPrice: (json['shippingPrice'] as num?)?.toInt(),
      taxPrice: (json['taxPrice'] as num?)?.toInt(),
      totalOrderPrice: (json['totalOrderPrice'] as num?)?.toInt(),
      paymentMethodType: json['paymentMethodType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'shippingPrice': instance.shippingPrice,
      'taxPrice': instance.taxPrice,
      'totalOrderPrice': instance.totalOrderPrice,
      'paymentMethodType': instance.paymentMethodType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'shippingAddress': instance.shippingAddress,
      'cartItems': instance.cartItems,
      'user': instance.user,
    };

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      details: json['details'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'details': instance.details,
      'phone': instance.phone,
      'city': instance.city,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['_id'] as String?,
      count: (json['count'] as num?)?.toInt(),
      product: json['product'] == null
          ? null
          : ProductInOrder.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      '_id': instance.id,
      'count': instance.count,
      'product': instance.product,
      'price': instance.price,
    };

ProductInOrder _$ProductInOrderFromJson(Map<String, dynamic> json) =>
    ProductInOrder(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      imageCover: json['imageCover'] as String?,
    );

Map<String, dynamic> _$ProductInOrderToJson(ProductInOrder instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'imageCover': instance.imageCover,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
