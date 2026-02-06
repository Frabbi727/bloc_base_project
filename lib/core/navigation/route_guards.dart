import '../routes/app_routes.dart';

class RouteGuards {
  static final Set<String> _protected = {
    AppRoutes.dashboard,
  };

  static bool isProtected(String? route) => _protected.contains(route);
}
