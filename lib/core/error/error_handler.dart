import 'package:dio/dio.dart';
import 'failures.dart';
import 'exceptions.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is ServerException) {
      return ServerFailure(error.message);
    } else if (error is NetworkException) {
      return NetworkFailure(error.message);
    } else if (error is CacheException) {
      return CacheFailure(error.message);
    } else if (error is DioException) {
      return _handleDioError(error);
    } else {
      return ServerFailure('Unexpected error occurred');
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure('Connection timeout');

      case DioExceptionType.badResponse:
        return ServerFailure(
          error.response?.data?['message'] ?? 'Server error',
        );

      case DioExceptionType.cancel:
        return const NetworkFailure('Request cancelled');

      default:
        return const NetworkFailure('Network error occurred');
    }
  }

  static String getErrorMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is NetworkFailure) {
      return 'Please check your internet connection';
    } else if (failure is CacheFailure) {
      return 'Failed to load cached data';
    } else {
      return 'Something went wrong';
    }
  }
}
