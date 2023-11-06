import 'dart:async';
import 'dart:developer' as dev;

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'auth/auth_widget.dart';
import 'auth/model/language_ext.dart';
import 'auth/model/user_entity.dart';
import 'common/domain/remote_config/remote_config_repository.dart';
import 'common/push_notification/push_notification_repository.dart';
import 'gen/fonts.gen.dart';
import 'nmd_environment.dart';
import 'root/domain/crashlytics.dart';
import 'root/domain/init_logging.dart';
import 'root/domain/injectable.dart';
import 'root/nmd_route_observer.dart';
import 'translations/codegen_loader.g.dart';

void main() async {
  FirebaseCrashlytics? crashlytics;

  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    try {
      await Firebase.initializeApp(options: NmdEnvironment.firebaseOptions);

      if (!kIsWeb) crashlytics = FirebaseCrashlytics.instance;
    } catch (e) {
      debugPrint("Firebase couldn't be initialized: $e");
    }

    initLogging(crashlytics);
    await enableCrashCollection(crashlytics);

    await guardedMain();
  }, (e, st) {
    if (kIsWeb) {
      debugPrint('[ERROR] $e');
    } else {
      dev.log('\x1B[31m[ERROR] $e\x1B[0m', error: e, stackTrace: st);
      crashlytics?.recordError(e, st, fatal: true);
    }
  });
}

Future<void> guardedMain() async {
  await initializeDateFormatting();
  await EasyLocalization.ensureInitialized();

  await configureDependencies();
  await getIt<RemoteConfigRepository>().initialize();
  await getIt<PushNotificationRepository>().initialize();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'lib/translations',
        assetLoader: const CodegenLoader(),
        fallbackLocale: Language.en.locale,
        useOnlyLangCode: true,
        child: const Application(),
      ),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: NmdEnvironment.isDev,
      navigatorObservers: [routeObserver],
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff264653),
          primaryContainer: Color(0xffd0e4ff),
          secondary: Color(0xffe9c46a),
          secondaryContainer: Color(0xffffdbcf),
          tertiary: Color(0xffff7d80),
          tertiaryContainer: Color(0xff95f0ff),
          appBarColor: Color(0xffffdbcf),
          error: Color(0xffb00020),
        ),
        onPrimary: Colors.white,
        scaffoldBackground: const Color(0xffFBFFFF),
        usedColors: 2,
        subThemesData: const FlexSubThemesData(
          useM2StyleDividerInM3: true,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          keepPrimary: true,
          keepSecondary: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: FontFamily.lato,
      ),
      home: const AuthWidget(),
    );
  }
}
