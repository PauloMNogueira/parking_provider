import 'package:flutter/material.dart';
import 'package:super_module/services/route.service.dart';

class BasicRouteService extends RouteService {
  final Map<String, WidgetBuilder> _routes = {};

  @override
  Map<String, WidgetBuilder> get routes => _routes;

  BasicRouteService(
      {super.initialRoute = '/',
      super.splashScreenRoute = '/splash-screen',
      Map<String, WidgetBuilder> baseRoutes = const {}}) {
    _routes.addAll(baseRoutes);
  }

  @override
  void registerRoute(String routePath, WidgetBuilder page,
      {String layoutName = 'default'}) {
    if (_routes.containsKey(routePath)) {
      throw Exception('Route Path $routePath already exists!');
    }
    _routes[routePath] = page;
  }

  @override
  void changeInitialRoute(String initialRoute) {
    this.initialRoute = initialRoute;
  }

  @override
  void addMiddleware(
      String routeName, Function(BuildContext context) middleware) {
    /// Validate if this route Exists
    if (!_routes.containsKey(routeName)) {
      // TODO, handle future route registration
      return;
    }

    /// Create a context to store the current Route
    WidgetBuilder currentPage = _routes[routeName]!;

    /// Append Middleware
    _routes[routeName] = (BuildContext context) {
      middleware(context);
      return currentPage(context);
    };
  }
}
