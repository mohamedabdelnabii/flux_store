import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  static const String fontFamily = 'Tajawal';
  static const String isArabic = 'isArabic';

  // Shared Preferences keys
  static const String prefsAccessToken = 'access_token';
  static const String prefsAccessExpiresAt = 'access_expires_at';
  static const String prefsRefreshToken = 'refresh_token';
  static const String prefsRefreshExpiresAt = 'refresh_expires_at';
  static const String prefsEmail = 'email';
  static const String prefsFirstName = 'firstName';
  static const String prefsPhone = 'phone';
  static const String prefsUserId = 'userId';
  static const String prefsIsNotFirstLogin = 'isNotFirstLogin';
  static const String prefsCountryCode = 'country_code';

  static double paddingHorizontal = 20.w;
  static double productItemAspectRatio = 0.80;
  static double productItemWidth = 160.w;
  static double productItemHeight = 265.h;
  static double homeBannerRatio = 1.2;
  static int paymentMethodCashId = 2;
  static int shippingOptionSA = 5;
  static int freeShippingThreshold = 299;
  // Extra fee applied when cart contains at least one global product (is_local == 0)
  static const int globalExtraFee = 15;
  static const int cashOnDeliveryFee = 18;
  // Navigation indices
  static int indexHome = 0;
  static int indexSearch = 1;
  static int indexCart = 2;
  static int indexSettings = 3;

  static const String recentSearches = 'recent_searches';
}
