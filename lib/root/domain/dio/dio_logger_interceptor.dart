import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

Logger _log = Logger('$DioLoggerInterceptor');

class DioLoggerInterceptor extends Interceptor {
  DioLoggerInterceptor({
    this.requestHeader = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.maxWidth = 90,
    this.requestLevel,
    this.responseLevel,
    this.errorLevel,
  });

  final LogLevel? requestLevel;
  final LogLevel? responseLevel;
  final LogLevel? errorLevel;

  /// Print request header [Options.headers]
  final bool requestHeader;

  // ignore: comment_references
  /// Print request data [Options.data]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// Width size per logPrint
  final int maxWidth;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _printRequestHeader(options);
    if (requestHeader) {
      _prettyPrintObject(options.queryParameters, header: 'Query Parameters');
      final requestHeaders = <String, dynamic>{};
      // ignore: cascade_invocations
      requestHeaders.addAll(options.headers);
      requestHeaders['contentType'] = options.contentType?.toString();
      requestHeaders['responseType'] = options.responseType.toString();
      requestHeaders['followRedirects'] = options.followRedirects;
      requestHeaders['connectTimeout'] = options.connectTimeout;
      requestHeaders['receiveTimeout'] = options.receiveTimeout;

      _prettyPrintObject(requestHeaders, header: 'Headers');
      _prettyPrintObject(options.extra, header: 'Extras');
    }
    if (requestBody && options.method != 'GET') {
      final Object? data = options.data;
      if (data == null) {
        super.onRequest(options, handler);
        return;
      }

      if (data is FormData) {
        final formDataMap = <String, Object>{}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        _prettyPrintObject(formDataMap, header: 'Form data | ${data.boundary}');
      } else {
        _prettyPrintObject(data, header: 'Body');
      }
    }

    _commit(requestLevel ?? LogLevel.info);
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!error) return;

    if (err.type == DioExceptionType.badResponse) {
      logPrint(
        '<<< DioError │ ${err.requestOptions.method} │ ${err.response?.statusCode} ${err.response?.statusMessage} │ ${err.response?.requestOptions.uri}',
      );
      if (err.response != null && err.response?.data != null) {
        _prettyPrintObject(
          err.response?.data as Object,
          header: 'DioError │ ${err.type}',
        );
      }
    } else {
      logPrint(
        '<<< DioError (No response) │ ${err.requestOptions.method} │ ${err.requestOptions.uri}',
      );
      logPrint('╔ ERROR');
      logPrint('║  ${(err.message ?? '').replaceAll('\n', '\n║  ')}');
      _printLine(pre: '╚');
    }

    _commit(errorLevel ?? LogLevel.error);
    super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    _printResponseHeader(response);
    if (responseHeader) {
      _prettyPrintObject(response.headers, header: 'Headers');
    }

    if (responseBody) {
      _printResponse(response);
    }

    _commit(responseLevel ?? LogLevel.debug);
    super.onResponse(response, handler);
  }

  void _printResponse(Response<dynamic> response) {
    final Object? data = response.data;

    if (data != null) {
      _prettyPrintObject(data, header: 'Body');
    }
  }

  void _prettyPrintObject(Object data, {String? header}) {
    String value;

    try {
      final object = const JsonDecoder().convert(data.toString()) as Object;
      const json = JsonEncoder.withIndent('  ');
      value = '║  ${json.convert(object).replaceAll('\n', '\n║  ')}';
    } catch (e) {
      value = '║  ${data.toString().replaceAll('\n', '\n║  ')}';
    }

    logPrint('╔  $header');
    logPrint('║');
    logPrint(value);
    logPrint('║');
    _printLine(pre: '╚');
  }

  void _printResponseHeader(Response<dynamic> response) {
    final uri = response.requestOptions.uri;
    final method = response.requestOptions.method;
    logPrint(
      '<<< Response │ $method │ ${response.statusCode} ${response.statusMessage} │ $uri',
    );
  }

  void _printRequestHeader(RequestOptions options) {
    final uri = options.uri;
    final method = options.method;
    logPrint('>>> Request │ $method │ $uri');
  }

  void _printLine({String pre = '', String suf = '╝'}) => logPrint(
        '$pre${'═' * maxWidth}$suf',
      );

  final StringBuffer _value = StringBuffer();

  void logPrint(String value) {
    if (_value.isEmpty) {
      _value.write(value);
    } else {
      _value.write('\n$value');
    }
  }

  void _commit(LogLevel level) {
    if (level.priority >= LogLevel.error.priority) {
      final valueError = _value.toString();
      final errorTitle = valueError.substring(0, valueError.indexOf('\n'));
      final errorBody = valueError.substring(errorTitle.length);
      _log.log(level.loggerLevel, errorTitle, errorBody);
    } else {
      _log.log(level.loggerLevel, _value.toString());
    }
    _value.clear();
  }
}

class LogLevel {
  const LogLevel(this.name, this.priority)
      : assert(
          priority > 0 && priority < 100,
          'Priority level cannot be less than 1 or greater than 99',
        );

  const LogLevel._(this.name, this.priority);

  /// Reserved levels
  static const LogLevel all = LogLevel._('All', 0);
  static const LogLevel off = LogLevel._('Off', 100);

  /// Default levels
  static const LogLevel debug = LogLevel('Debug', 2);
  static const LogLevel info = LogLevel('Info', 4);
  static const LogLevel warning = LogLevel('Warning', 8);
  static const LogLevel error = LogLevel('Error', 16);

  static const List<LogLevel> values = [all, debug, info, warning, error, off];

  final int priority;
  final String name;

  @override
  String toString() {
    return name;
  }

  Level get loggerLevel {
    switch (this) {
      case LogLevel.debug:
        return Level.FINE;
      case LogLevel.info:
        return Level.INFO;
      case LogLevel.warning:
        return Level.WARNING;
      case LogLevel.error:
        return Level.SEVERE;
      default:
        return Level.OFF;
    }
  }
}
