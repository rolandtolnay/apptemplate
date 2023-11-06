import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version/version.dart';

import '../../root/domain/injectable.dart';
import '../domain/prince_of_versions.dart';
import '../domain/remote_config/remote_config_repository.dart';

final appUpdateProvider = ChangeNotifierProvider<AppUpdateNotifier>((ref) {
  return AppUpdateNotifier(getIt(), getIt(), getIt());
});

const _storageKey = 'app_update_last_shown';

class AppUpdateNotifier extends ChangeNotifier {
  final RemoteConfigRepository _repository;
  final PackageInfo _packageInfo;
  final SharedPreferences _prefs;

  bool _isShowingDialog = false;

  AppUpdateNotifier(this._repository, this._packageInfo, this._prefs);

  void didShowDialog() {
    _isShowingDialog = true;
    if (appUpdateData?.isRequired ?? true) return;

    _prefs.setString(_storageKey, DateTime.now().toIso8601String());
    notifyListeners();
  }

  void didDismissDialog() {
    _isShowingDialog = false;
    notifyListeners();
  }

  AppUpdateData? get appUpdateData {
    final princeOfVersions = _repository.princeOfVersions;

    final config = princeOfVersions.configFor(defaultTargetPlatform);
    if (config == null) return null;

    return AppUpdateData(
      versionName: config.versionName,
      installUrl: config.installUrl,
      isRequired: config.isRequired(
        currentVersion: _packageInfo.currentVersion(defaultTargetPlatform),
      ),
    );
  }

  bool get shouldShowDialog {
    if (_isShowingDialog) return false;

    final platform = defaultTargetPlatform;

    final config = _repository.princeOfVersions.configFor(platform);
    if (config == null) return false;

    final version = _packageInfo.currentVersion(platform);
    if (!config.isNewerThan(version)) return false;

    if (appUpdateData?.isRequired ?? false) return true;

    final lastShown = _prefs.getString(_storageKey);
    if (lastShown == null) return true;

    final lastShownDate = DateTime.parse(lastShown);
    final now = DateTime.now();
    return now.difference(lastShownDate).inHours > 72;
  }
}

class AppUpdateData {
  final String? versionName;
  final String? installUrl;
  final bool isRequired;

  AppUpdateData({
    required this.versionName,
    required this.installUrl,
    required this.isRequired,
  });
}

extension on PackageInfo {
  String currentVersion(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return buildNumber;
      case TargetPlatform.iOS:
        return version;
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
    }
  }
}

extension on PrinceOfVersions {
  PlatformVersionConfig? configFor(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return null;
    }
  }
}

extension on PlatformVersionConfig {
  bool isNewerThan(String currentVersion) {
    final updateVersion = lastVersion ?? requiredVersion;
    if (updateVersion == null) return false;

    final update = Version.parse(updateVersion);
    final current = Version.parse(currentVersion);

    return update > current;
  }

  bool isRequired({required String currentVersion}) {
    if (requiredVersion == null) return false;

    final update = Version.parse(requiredVersion ?? '');
    return update > Version.parse(currentVersion);
  }
}
