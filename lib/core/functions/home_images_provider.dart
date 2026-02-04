import 'package:flutter/material.dart';
import 'package:flux_store/core/helpers/localizationa.dart';

class HomeImagesProvider {
  static bool getBanners(BuildContext context) {
    return isArabicLocale(context);
  }
}
