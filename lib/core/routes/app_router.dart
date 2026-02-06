import 'package:flutter/material.dart';
import '../startup/splash_page.dart';
import '../startup/auth_session.dart';
import '../navigation/route_guards.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final session = AuthSession();
    final isProtected = RouteGuards.isProtected(settings.name);
    if (isProtected && !session.isInitialized) {
      return MaterialPageRoute(builder: (_) => const SplashPage());
    }
    if (isProtected && !session.isAuthenticated) {
      return MaterialPageRoute(builder: (_) => const LoginPage());
    }

    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
    }
  }
}
