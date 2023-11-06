import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dio/create_dio.dart';
import 'injectable.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  await getIt.init();
}

@module
abstract class AppModule {
  @lazySingleton
  FirebaseFirestore get firFirestore => FirebaseFirestore.instance;

  @lazySingleton
  Dio get dio => createDio();

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
}
