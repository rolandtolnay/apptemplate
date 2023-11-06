import 'package:dio/dio.dart';

import '../injectable.dart';
import 'app_version_interceptor.dart';
import 'auth_interceptor.dart';
import 'dio_logger_interceptor.dart';

Dio createDio() {
  final Dio dio;

  final options = BaseOptions(contentType: 'application/json');
  dio = Dio(options);

  dio.interceptors.addAll(
    <Interceptor>[
      AppVersionInterceptor(getIt()),
      AuthInterceptor(),
      DioLoggerInterceptor(requestBody: true),
    ],
  );
  return dio;
}
