import '../helpers/app_assets.dart';

String? getImageForMethod(String? code) {
  switch (code?.toLowerCase()) {
    case 'cod':
      return Assets.imagesPngCashOnDelivery;
    case 'apple':
      return Assets.imagesPngApplePay;

    default:
      return Assets.imagesPngCreditCard;
  }
}
