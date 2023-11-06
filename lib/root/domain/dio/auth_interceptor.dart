import 'package:dio/dio.dart';

import '../../../common/domain/api_endpoints.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final url = options.uri.toString();
    // TODO(developer): add auth token to header
    if (url.contains(ApiEndpoints.baseUrl)) {
      // options.queryParameters['apiKey'] = _decode(NmdEnvironment.backendApiKey);
    }

    super.onRequest(options, handler);
  }

  // String _decode(String apiKey) => utf8.decode(base64.decode(apiKey));
}
