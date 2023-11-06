import 'dart:developer' as dev;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

import 'crashlytics.dart';

void initLogging(FirebaseCrashlytics? crashlytics) {
  Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;

  Logger.root.onRecord.listen((record) {
    final formattedMessage =
        '${DateFormat('HH:mm:ss.S').format(record.time)} - '
        '${record.loggerName}: ${record.message}';
    if (record.level >= Level.SEVERE) {
      // Log with color red
      dev.log('\x1B[31m${record.message}\x1B[0m');
    } else if (record.level == Level.WARNING) {
      // Log with color yellow
      dev.log('\x1B[33m${record.message}\x1B[0m');
    } else if (record.level == Level.INFO) {
      // Log with color green
      dev.log('\x1B[32m${record.message}\x1B[0m');
    } else {
      // Log with color blue
      if (kIsWeb) {
        debugPrint(formattedMessage);
      } else {
        dev.log('\x1B[34m$formattedMessage\x1B[0m');
      }
    }

    if (!kDebugMode) {
      // Add the message to the rotating Crashlytics log.
      crashlytics?.log(formattedMessage);

      if (record.level >= Level.WARNING) {
        if (record.error != null) {
          crashlytics?.recordError(
            record.error,
            record.stackTrace.filtered,
            fatal: record.level >= Level.SEVERE,
          );
        } else {
          crashlytics?.recordError(
            '${record.loggerName}: ${record.message}',
            StackTrace.current.filtered,
            fatal: record.level >= Level.SEVERE,
          );
        }
      }
    }
  });
}
