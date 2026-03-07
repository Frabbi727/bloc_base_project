import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _log(String action, Route<dynamic> route, Route<dynamic>? previous) {
    final name = route.settings.name ?? route.runtimeType.toString();
    final prevName =
        previous?.settings.name ?? previous?.runtimeType.toString();
    debugPrint('Route $action: $name (from $prevName)');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _log('push', route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _log('pop', route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _log('replace', newRoute, oldRoute);
    }
  }
}

final appRouteObserver = AppRouteObserver();
