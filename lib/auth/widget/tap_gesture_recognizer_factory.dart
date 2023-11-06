import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/domain/remote_config/remote_config_repository.dart';
import '../../root/domain/injectable.dart';

class TapGestureRecognizerFactory {
  TapGestureRecognizer makePrivacyTapRecognizer() {
    return TapGestureRecognizer()
      ..onTap = () {
        launchUrlString(getIt<RemoteConfigRepository>().privacyUrl);
      };
  }

  TapGestureRecognizer makeTermsTapRecognizer() {
    return TapGestureRecognizer()
      ..onTap = () {
        launchUrlString(getIt<RemoteConfigRepository>().termsUrl);
      };
  }
}
