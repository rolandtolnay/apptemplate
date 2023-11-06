import 'dart:developer' as dev;
import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

Future<void> enableCrashCollection(FirebaseCrashlytics? crashlytics) async {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  if (crashlytics == null) return;

  FlutterError.onError = (d) => _recordFlutterError(d, crashlytics);
  await crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);

  if (!kIsWeb) {
    // To catch errors outside of the Flutter context, we attach an error
    // listener to the current isolate.
    Isolate.current.addErrorListener(
      RawReceivePort((dynamic pair) async {
        final errorAndStacktrace = pair as List<dynamic>;
        await crashlytics.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last as StackTrace?,
        );
      }).sendPort,
    );
  }
}

Future<void> _recordFlutterError(
  FlutterErrorDetails details,
  FirebaseCrashlytics? crashlytics,
) async {
  FlutterError.presentError(details);

  final information = details.informationCollector?.call() ?? [];
  await crashlytics?.recordError(
    details.exceptionAsString(),
    details.stack.filtered,
    reason: (details.context as DiagnosticsProperty?)?.valueToString(),
    information: information,
    printDetails: false,
  );
}

extension CrashlitycsStackTraceFilter on StackTrace? {
  StackTrace? get filtered {
    if (this == null) return null;

    try {
      final lines = toString().split('\n');
      final buf = StringBuffer();
      for (final line in lines) {
        if (line.contains('crashlytics.dart') ||
            line.contains('_BroadcastStreamController.java') ||
            line.contains('logger.dart')) {
          continue;
        }
        buf.writeln(line);
      }
      return StackTrace.fromString(buf.toString());
    } catch (e, st) {
      const message = 'Problem while filtering stack trace';
      dev.log('\x1B[31m$message\x1B[0m', error: e, stackTrace: st);
    }

    // If there was an error while filtering,
    // return the original, unfiltered stack track.
    return this;
  }
}
