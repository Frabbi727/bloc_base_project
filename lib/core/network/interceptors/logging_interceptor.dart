import 'package:dio/dio.dart';
import 'dart:developer' as developer;
import '../../config/app_config.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AppConfig.enableLogging) {
      developer.log(
        '🌐 REQUEST[${options.method}] => PATH: ${options.uri}\n'
            'Headers: ${options.headers}\n'
            'Query Parameters: ${options.queryParameters}\n'
            'Body: ${options.data}',
        name: 'API Request',
      );
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (AppConfig.enableLogging) {
      developer.log(
        '✅ RESPONSE[${response.statusCode}] => PATH: ${response.realUri}\n'
            'Data: ${response.data}',
        name: 'API Response',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (AppConfig.enableLogging) {
      developer.log(
        '❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n'
            'Message: ${err.message}\n'
            'Response: ${err.response?.data}',
        name: 'API Error',
      );
    }
    handler.next(err);
  }
}