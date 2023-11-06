import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

abstract interface class PushNotificationRepository {
  Future<void> initialize();

  Future<PushNotificationPermission> requestPermissions({
    required bool provisional,
  });

  Future<void> subscribeToTopic(PushNotificationTopic topic);

  Future<void> unsubscribeFromTopic(PushNotificationTopic topic);
}

Logger _log = Logger('$PushNotificationRepository');

@LazySingleton(as: PushNotificationRepository)
class FirPushNotificationRepository implements PushNotificationRepository {
  final _messaging = FirebaseMessaging.instance;

  @override
  Future<void> initialize() async {
    // Show visible notifications on iOS while the app is on foreground.
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @override
  Future<PushNotificationPermission> requestPermissions({
    required bool provisional,
  }) async {
    final settings = await _messaging.requestPermission(
      provisional: provisional,
    );

    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
        return PushNotificationPermission.granted;
      case AuthorizationStatus.provisional:
        return PushNotificationPermission.provisional;
      case AuthorizationStatus.notDetermined:
        return PushNotificationPermission.notAsked;
      case AuthorizationStatus.denied:
        return PushNotificationPermission.deniedSystem;
    }
  }

  @override
  Future<void> subscribeToTopic(PushNotificationTopic topic) async {
    try {
      await _messaging.subscribeToTopic(topic.name);
    } catch (e, st) {
      _log.severe('Failed subcribe to $topic: $e', e, st);
    }
  }

  @override
  Future<void> unsubscribeFromTopic(PushNotificationTopic topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic.name);
    } catch (e, st) {
      _log.severe('Failed unsubcribe from $topic: $e', e, st);
    }
  }
}

enum PushNotificationPermission {
  granted,
  provisional,
  notAsked,
  deniedSystem,
  deniedSettings
}

enum PushNotificationTopic {
  appUpdates;

  String get name {
    return switch (this) { PushNotificationTopic.appUpdates => 'app_updates' };
  }
}
