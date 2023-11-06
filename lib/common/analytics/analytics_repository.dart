import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recase/recase.dart';
import 'package:synchronized/synchronized.dart';

abstract interface class AnalyticsRepository {
  void identify(String userId);

  Future<void> deIdentify();

  void trackEvent(String event, [Map<String, dynamic>? properties]);

  void trackScreen(String screenName);
}

Logger _log = Logger('$AnalyticsRepository');

@LazySingleton(as: AnalyticsRepository)
class FirAnalyticsRepository implements AnalyticsRepository {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final Lock _lock = Lock();

  @override
  void identify(String userId, [Map<String, dynamic>? properties]) {
    _execute(() => _analytics.setUserId(id: userId));
  }

  @override
  Future<void> deIdentify() {
    return _execute(() => _analytics.resetAnalyticsData());
  }

  @override
  void trackEvent(String event, [Map<String, dynamic>? properties]) {
    _execute(
      () => _analytics.logEvent(
        name: event.snakeCase,
        parameters:
            properties?.map((key, value) => MapEntry(key.snakeCase, value)),
      ),
    );
  }

  @override
  void trackScreen(String screenName) {
    _execute(() => _analytics.logScreenView(screenName: screenName.snakeCase));
  }

  Future<void> _execute(Future<void> Function() function) {
    return _lock.synchronized(() async {
      try {
        await function();
      } catch (error, stackTrace) {
        _log.shout('Failed to track analytics: $error', error, stackTrace);
      }
    });
  }
}
