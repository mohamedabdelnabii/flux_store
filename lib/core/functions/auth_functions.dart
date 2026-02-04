//
// import 'package:flux_store/core/helpers/app_constants.dart';
// import 'package:flux_store/core/helpers/shared_pref_helper.dart';
// import 'package:flux_store/core/networking/dio_factory.dart';
//
// Future<void> loginSuccessAction(
//   {
//   required  Tokens tokens,
//   required String email,
//   required String firstName,
//   required int userId,
//   }
// ) async {
//        await saveUserToken(tokens);
//      SharedPrefHelper.setSecuredString(
//        AppConstants.prefsEmail,
//         email,
//      );
//
//      SharedPrefHelper.setSecuredString(
//        AppConstants.prefsFirstName,
//         firstName,
//      );
//
//      SharedPrefHelper.setSecuredInt(
//        AppConstants.prefsUserId,
//         userId,
//      );
//   }
//
//
//
//
// Future<void> saveUserToken(Tokens token) async {
//   await SharedPrefHelper.setSecuredString(AppConstants.prefsAccessToken, token.accessToken);
//   await SharedPrefHelper.setSecuredString(AppConstants.prefsAccessExpiresAt, token.accessExpiresAt);
//   await SharedPrefHelper.setSecuredString(AppConstants.prefsRefreshToken, token.refreshToken);
//   await SharedPrefHelper.setSecuredString(AppConstants.prefsRefreshExpiresAt, token.refreshExpiresAt);
//   DioFactory.setTokenIntoHeaderAfterLogin(token.accessToken);
// }
