// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentCardModelAdapter extends TypeAdapter<PaymentCardModel> {
  @override
  final int typeId = 100;

  @override
  PaymentCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentCardModel(
      cardHolderName: fields[0] as String,
      cardNumber: fields[1] as String,
      expiryDate: fields[2] as String,
      cvv: fields[3] as String,
      id: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentCardModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cardHolderName)
      ..writeByte(1)
      ..write(obj.cardNumber)
      ..writeByte(2)
      ..write(obj.expiryDate)
      ..writeByte(3)
      ..write(obj.cvv)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCardModel _$PaymentCardModelFromJson(Map<String, dynamic> json) =>
    PaymentCardModel(
      cardHolderName: json['cardHolderName'] as String,
      cardNumber: json['cardNumber'] as String,
      expiryDate: json['expiryDate'] as String,
      cvv: json['cvv'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PaymentCardModelToJson(PaymentCardModel instance) =>
    <String, dynamic>{
      'cardHolderName': instance.cardHolderName,
      'cardNumber': instance.cardNumber,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
      'id': instance.id,
    };
