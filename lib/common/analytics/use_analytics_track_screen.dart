import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../root/domain/injectable.dart';
import '../../root/nmd_route_observer.dart';
import 'analytics_repository.dart';

void useAnalyticsTrackScreen(String screenName) {
  use(_AnalyticsTrackScreen(screenName: screenName));
}

class _AnalyticsTrackScreen extends Hook<void> {
  const _AnalyticsTrackScreen({required this.screenName});

  final String screenName;

  @override
  _AnalyticsTrackScreenState createState() => _AnalyticsTrackScreenState();
}

class _AnalyticsTrackScreenState extends HookState<void, _AnalyticsTrackScreen>
    with RouteAware {
  ModalRoute<Object?>? _currentRoute;

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void build(BuildContext context) {
    final newRoute = ModalRoute.of(useContext());
    if (_currentRoute != newRoute) {
      routeObserver.unsubscribe(this);
      _currentRoute = newRoute;
      routeObserver.subscribe(this, _currentRoute!);
    }
  }

  @override
  void didPush() {
    _track();
  }

  @override
  void didPopNext() {
    _track();
  }

  void _track() {
    getIt<AnalyticsRepository>().trackScreen(hook.screenName);
  }
}
