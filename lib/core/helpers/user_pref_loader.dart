import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';

/// Lightweight model for commonly used user fields stored in secure prefs.
class BasicUserInfo {
  final String name;
  final String email;
  final String phone;

  const BasicUserInfo({
    required this.name,
    required this.email,
    required this.phone,
  });

  bool get hasAny => name.isNotEmpty || email.isNotEmpty || phone.isNotEmpty;
}

/// Centralized loader for reading cached user info from Shared Preferences.
class UserPrefLoader {
  const UserPrefLoader._();

  /// Reads name/email/phone from secure storage. Returns empty strings if not found.
  static Future<BasicUserInfo> load() async {
    final name = await SharedPrefHelper.getSecuredString(
      AppConstants.prefsFirstName,
    );
    final email = await SharedPrefHelper.getSecuredString(
      AppConstants.prefsEmail,
    );
    final phone = await SharedPrefHelper.getSecuredString(
      AppConstants.prefsPhone,
    );

    return BasicUserInfo(name: name, email: email, phone: phone);
  }
}
