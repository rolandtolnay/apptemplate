import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

import '../../../nmd_environment.dart';
import '../prince_of_versions.dart';
import 'remote_config_key.dart';
import 'remote_config_value.dart';

abstract class RemoteConfigRepository {
  Future<void> initialize();

  Future<bool> fetchAndActivate();

  String get privacyUrl;

  String get termsUrl;

  PrinceOfVersions get princeOfVersions;
}

Logger _log = Logger('$RemoteConfigRepository');

@LazySingleton(as: RemoteConfigRepository)
class FirRemoteConfigRepository implements RemoteConfigRepository {
  final _instance = FirebaseRemoteConfig.instance;

  @override
  Future<bool> fetchAndActivate() => _instance.fetchAndActivate();

  @override
  Future<void> initialize() async {
    try {
      if (NmdEnvironment.isDev || kDebugMode) {
        await _instance.setConfigSettings(
          RemoteConfigSettings(
            fetchTimeout: const Duration(minutes: 1),
            minimumFetchInterval: const Duration(minutes: 5),
          ),
        );
      }

      final defaults = Map.fromEntries(
        RemoteConfigKey.values.map((e) {
          if (e.defaultValue is RemoteConfigValueJson) {
            return MapEntry(e.storageKey, jsonEncode(e.defaultValue.value));
          }
          return MapEntry(e.storageKey, e.defaultValue.value);
        }),
      );
      await _instance.setDefaults(defaults);

      await _instance.fetchAndActivate();
    } catch (e, st) {
      _log.severe('Failed to initialize remote config: $e', e, st);
    }
  }

  @override
  String get privacyUrl => _readValue(RemoteConfigKey.privacyUrl) as String;

  @override
  String get termsUrl => _readValue(RemoteConfigKey.termsUrl) as String;

  @override
  PrinceOfVersions get princeOfVersions => PrinceOfVersions.fromJson(
        _readValue(RemoteConfigKey.princeOfVersions) as Map<String, dynamic>,
      );

  dynamic _readValue(RemoteConfigKey key) {
    try {
      switch (key.defaultValue) {
        case RemoteConfigValueString():
          return _instance.getString(key.storageKey);
        case RemoteConfigValueBool():
          return _instance.getBool(key.storageKey);
        case RemoteConfigValueDouble():
          return _instance.getDouble(key.storageKey);
        case RemoteConfigValueInt():
          return _instance.getInt(key.storageKey);
        case RemoteConfigValueJson():
          return jsonDecode(_instance.getString(key.storageKey));
      }
    } catch (e, st) {
      _log.severe('Failed to read remote config value for $key: $e', e, st);
      return key.defaultValue.value;
    }
  }
}
