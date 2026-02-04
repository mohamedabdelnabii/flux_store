// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrdersResponseAdapter extends TypeAdapter<OrdersResponse> {
  @override
  final int typeId = 11;

  @override
  OrdersResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrdersResponse(
      status: fields[0] as String?,
      data: (fields[1] as List?)?.cast<OrderModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrdersResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrdersResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 12;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      shippingAddress: fields[0] as ShippingAddress?,
      id: fields[1] as String?,
      user: fields[2] as UserInOrder?,
      cartItems: (fields[3] as List?)?.cast<CartProductItem>(),
      totalOrderPrice: fields[4] as int?,
      paymentMethodType: fields[5] as String?,
      isPaid: fields[6] as bool?,
      isDelivered: fields[7] as bool?,
      createdAt: fields[8] as DateTime?,
      updatedAt: fields[9] as DateTime?,
      idNumber: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.shippingAddress)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.cartItems)
      ..writeByte(4)
      ..write(obj.totalOrderPrice)
      ..writeByte(5)
      ..write(obj.paymentMethodType)
      ..writeByte(6)
      ..write(obj.isPaid)
      ..writeByte(7)
      ..write(obj.isDelivered)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.idNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShippingAddressAdapter extends TypeAdapter<ShippingAddress> {
  @override
  final int typeId = 13;

  @override
  ShippingAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShippingAddress(
      details: fields[0] as String?,
      phone: fields[1] as String?,
      city: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShippingAddress obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.details)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserInOrderAdapter extends TypeAdapter<UserInOrder> {
  @override
  final int typeId = 14;

  @override
  UserInOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInOrder(
      id: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInOrder obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : UserInOrder.fromJson(json['user'] as Map<String, dynamic>),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalOrderPrice: (json['totalOrderPrice'] as num?)?.toInt(),
      paymentMethodType: json['paymentMethodType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      idNumber: (json['idNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'shippingAddress': instance.shippingAddress,
      '_id': instance.id,
      'user': instance.user,
      'cartItems': instance.cartItems,
      'totalOrderPrice': instance.totalOrderPrice,
      'paymentMethodType': instance.paymentMethodType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'idNumber': instance.idNumber,
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

UserInOrder _$UserInOrderFromJson(Map<String, dynamic> json) => UserInOrder(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserInOrderToJson(UserInOrder instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
