import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionInterceptor extends Interceptor {
  AppVersionInterceptor(this.packageInfo);

  static const String appVersion = 'App-Version';

  final PackageInfo packageInfo;
  String? appVersionValue;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      appVersionValue ??= await _resolveAppVersionHeader();
      options.headers[appVersion] = appVersionValue;
    } catch (e) {
      // ignored
    }
    super.onRequest(options, handler);
  }

  Future<String> _resolveAppVersionHeader() async {
    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;

    return '$version+$buildNumber';
  }
}
