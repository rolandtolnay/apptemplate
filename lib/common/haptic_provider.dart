import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../root/domain/injectable.dart';

final hapticProvider = ChangeNotifierProvider.autoDispose<HapticProvider>(
  (ref) => HapticProvider(getIt()),
);

enum HapticType { selection, light, medium, success, error, warning }

class HapticProvider extends ChangeNotifier {
  static const key = 'storage_haptic_effects';

  final SharedPreferences _prefs;

  HapticProvider(this._prefs);

  bool get hapticsEnabled => _prefs.getBool(key) ?? true;

  void setHapticsEnabled({required bool isOn}) {
    _prefs.setBool(key, isOn);
    notifyListeners();
  }

  void feedback(HapticType haptic) {
    if (!hapticsEnabled) return;

    switch (haptic) {
      case HapticType.selection:
        HapticFeedback.selectionClick();
      case HapticType.light:
        HapticFeedback.lightImpact();
      case HapticType.medium:
        HapticFeedback.mediumImpact();
      case HapticType.success:
        Vibrate.feedback(FeedbackType.success);
      case HapticType.error:
        Vibrate.feedback(FeedbackType.error);
      case HapticType.warning:
        Vibrate.feedback(FeedbackType.warning);
    }
  }
}
