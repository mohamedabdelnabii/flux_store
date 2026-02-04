import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flux_store/core/helpers/app_constants.dart';
import 'package:flux_store/core/helpers/shared_pref_helper.dart';
import 'package:flux_store/core/networking/api_constants.dart';
import 'package:flux_store/features/auth/presentation/screens/login_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flux_store/core/routes/app_router.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor();

  static const _skipEndpoints = <String>[
    ApiConstants.signup,
    ApiConstants.signin,
    ApiConstants.forgotPassword,
    ApiConstants.verifyResetCode,
    ApiConstants.resetPassword,
  ];

  bool _shouldSkip(String rawPath) {
    final path = rawPath.startsWith('http') ? Uri.parse(rawPath).path : rawPath;
    final normalized = path.startsWith('/') ? path : '/$path';
    return _skipEndpoints.any((e) => normalized == e || normalized.endsWith(e));
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final rawPath = options.path;

    if (_shouldSkip(rawPath)) {
      return handler.next(options);
    }

    final token = await SharedPrefHelper.getSecuredString(
      AppConstants.prefsAccessToken,
    );

    if (token.isNotEmpty) {
      options.headers['token'] = token;
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final rawPath = options.path;
    final status = err.response?.statusCode;

    debugPrint('[TokenInterceptor] onError for $rawPath, status: $status');

    if (_shouldSkip(rawPath)) {
      return handler.next(err);
    }

    if (status == 401) {
      debugPrint('[TokenInterceptor] 401 Unauthorized, logging out');
      await _logout();
    }

    return handler.next(err);
  }

  Future<void> _logout() async {
    debugPrint('[TokenInterceptor] Logging out user');
    await SharedPrefHelper.clearAllSecuredData();
    final context = AppRouter.navigatorKey.currentContext;
    if (context != null && context.mounted) {
      GoRouter.of(context).go(LoginView.routeName);
    }
  }
}
