import 'package:firebase_core/firebase_core.dart';

import 'firebase_options_dev.dart' as dev;
import 'firebase_options_prod.dart' as prod;

class NmdEnvironment {
  static const bool isDev = bool.fromEnvironment('isDev');

  static bool get isProd => !isDev;

  static FirebaseOptions get firebaseOptions => isDev
      ? dev.DefaultFirebaseOptions.currentPlatform
      : prod.DefaultFirebaseOptions.currentPlatform;
}
