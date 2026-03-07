import 'package:dio/dio.dart';
import '../../error/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException('Connection timeout. Please check your internet connection.');

      case DioExceptionType.badResponse:
        _handleStatusCode(err.response?.statusCode, err.response?.data);
        break;

      case DioExceptionType.cancel:
        throw NetworkException('Request cancelled');

      default:
        throw NetworkException('Network error occurred');
    }

    handler.next(err);
  }

  void _handleStatusCode(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        throw ServerException(data?['message'] ?? 'Bad request');
      case 401:
        throw ServerException('Unauthorized access');
      case 403:
        throw ServerException('Forbidden access');
      case 404:
        throw ServerException('Resource not found');
      case 500:
        throw ServerException('Internal server error');
      case 503:
        throw ServerException('Service unavailable');
      default:
        throw ServerException('Server error occurred');
    }
  }
}
