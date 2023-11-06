import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../common/domain/compact_map.dart';

final routeObserver = NmdRouteObserver();

Logger _log = Logger('$NmdRouteObserver');

class NmdRouteObserver extends RouteObserver<Route<dynamic>> {
  final List<Route<dynamic>> _navigationStack = [];

  Iterable<String> get routeNameList =>
      _navigationStack.compactMap((e) => e.settings.name);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _navigationStack.add(route);
    _log.fine('didPush: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _navigationStack.remove(route);
    _log.fine('didPop: ${route.settings.name}');
  }
}

extension NavigatorConvenience on NavigatorState {
  /// Check if the route is already in the stack and pop to it if it is.
  ///
  /// Otherwise, push the route.
  /// If `flattenStack` is true, all routes will be popped before pushing the route.
  Future<T?> pushOrPopUntil<T extends Object?>(
    Route<T> route, {
    VoidCallback? onPop,
    bool flattenStack = false,
  }) async {
    final routeName = route.settings.name;
    if (routeObserver.routeNameList.contains(routeName)) {
      Navigator.of(context).popUntil(
        (route) => route.settings.name == routeName,
      );
      onPop?.call();
      return Future.value();
    } else {
      if (flattenStack) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
      return Navigator.of(context).push(route);
    }
  }
}
