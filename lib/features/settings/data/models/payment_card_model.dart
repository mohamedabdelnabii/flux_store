import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_card_model.g.dart';

@HiveType(typeId: 100)
@JsonSerializable()
class PaymentCardModel {
  @HiveField(0)
  final String cardHolderName;
  @HiveField(1)
  final String cardNumber;
  @HiveField(2)
  final String expiryDate;
  @HiveField(3)
  final String cvv;
  @HiveField(4)
  final String? id;

  PaymentCardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    this.id,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCardModelToJson(this);
}
