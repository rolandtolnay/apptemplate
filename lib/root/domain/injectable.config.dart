// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boardbit/auth/domain/auth_repository.dart' as _i4;
import 'package:boardbit/auth/domain/profile_repository.dart' as _i8;
import 'package:boardbit/common/analytics/analytics_repository.dart' as _i3;
import 'package:boardbit/common/domain/remote_config/remote_config_repository.dart'
    as _i10;
import 'package:boardbit/common/push_notification/push_notification_repository.dart'
    as _i9;
import 'package:boardbit/root/domain/injectable.dart' as _i12;
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.AnalyticsRepository>(
        () => _i3.FirAnalyticsRepository());
    gh.lazySingleton<_i4.AuthRepository>(() => _i4.FirAuthRepository());
    gh.lazySingleton<_i5.Dio>(() => appModule.dio);
    gh.lazySingleton<_i6.FirebaseFirestore>(() => appModule.firFirestore);
    await gh.factoryAsync<_i7.PackageInfo>(
      () => appModule.packageInfo,
      preResolve: true,
    );
    gh.lazySingleton<_i8.ProfileRepository>(
        () => _i8.FirProfileRepository(gh<_i4.AuthRepository>()));
    gh.lazySingleton<_i9.PushNotificationRepository>(
        () => _i9.FirPushNotificationRepository());
    gh.lazySingleton<_i10.RemoteConfigRepository>(
        () => _i10.FirRemoteConfigRepository());
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true,
    );
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
