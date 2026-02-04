import 'package:flutter/material.dart';
import 'package:flux_store/core/routes/routes_list.dart';
import 'package:flux_store/features/auth/presentation/screens/welcome_view.dart';
import 'package:flux_store/features/home/presentation/screens/bottom_nav_bar_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  // Global navigator key for routing (used by TokenInterceptor on logout)
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Hold a single GoRouter instance to preserve state across rebuilds/hot reload
  static GoRouter? _router;

  static GoRouter getRouter({
    required bool isNotFirstLogin,
    required String token,
  }) {
    if (_router != null) return _router!;

    _router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: getInitialLocation(isNotFirstLogin, token),
      routes: RoutesList.all,
    );

    return _router!;
  }

  static String getInitialLocation(bool isNotFirstLogin, String token) {
    debugPrint('isNotFirstLogin: $isNotFirstLogin, token: ${token.isNotEmpty}');
    if (!isNotFirstLogin) {
      return WelcomeView.routeName;
    } else if (token.isNotEmpty) {
      return BottomNavBarView.routeName;
    } else {
      return WelcomeView.routeName;
    }
  }
}
