import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AddressHelper {
  static bool isArabicLocale(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'ar';
  }

  static Future<String> getAddressFromLatLng(
    double latitude,
    double longitude,
    BuildContext context,
  ) async {
    final bool isArabic = isArabicLocale(context);

    // Check internet connectivity first
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return _getSimpleFallback(latitude, longitude, isArabic);
    }

    // First attempt with normal timeout
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude).timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw Exception('First attempt timeout');
            },
          );

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;
        final address = _formatAddress(place, isArabic, latitude, longitude);
        if (address != _getSimpleFallback(latitude, longitude, isArabic)) {
          return address;
        }
      }
    } catch (e) {
      // Handle first attempt failure
    }

    // Second attempt with longer timeout
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude).timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              throw Exception('Second attempt timeout');
            },
          );

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;

        final address = _formatAddress(place, isArabic, latitude, longitude);
        return address;
      }
    } catch (e) {
      // Handle second attempt failure
    }

    return _getSimpleFallback(latitude, longitude, isArabic);
  }

  static String _getSimpleFallback(
    double latitude,
    double longitude,
    bool isArabic,
  ) {
    if (isArabic) {
      return 'الموقع المحدد: ${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}';
    } else {
      return 'Selected Location: ${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}';
    }
  }

  static String _formatAddress(
    Placemark place,
    bool isArabic,
    double latitude,
    double longitude,
  ) {
    final List<String> addressParts = [];

    // Add street name and number if available
    if (place.name != null && place.name!.isNotEmpty) {
      addressParts.add(place.name!);
    }

    // Add thoroughfare (street) if different from name
    if (place.thoroughfare != null &&
        place.thoroughfare!.isNotEmpty &&
        place.thoroughfare != place.name) {
      addressParts.add(place.thoroughfare!);
    }

    // Add sub locality (neighborhood/district)
    if (place.subLocality != null && place.subLocality!.isNotEmpty) {
      addressParts.add(place.subLocality!);
    }

    // Add locality (city/town)
    if (place.locality != null && place.locality!.isNotEmpty) {
      addressParts.add(place.locality!);
    }

    // Add administrative area (state/region)
    if (place.administrativeArea != null &&
        place.administrativeArea!.isNotEmpty) {
      addressParts.add(place.administrativeArea!);
    }

    // Add country if available
    if (place.country != null && place.country!.isNotEmpty) {
      addressParts.add(place.country!);
    }

    // Remove duplicates and empty strings
    final uniqueParts = addressParts
        .where((part) => part.trim().isNotEmpty)
        .toSet()
        .toList();

    // Join with appropriate separator based on language
    final separator = isArabic ? '، ' : ', ';

    if (uniqueParts.isNotEmpty) {
      return uniqueParts.join(separator);
    }

    // Fallback to simple location description if no address parts found
    return _getSimpleFallback(latitude, longitude, isArabic);
  }
}
