import 'package:bloc_skeleton_project/core/error/error_handler.dart';
import 'package:bloc_skeleton_project/core/error/exceptions.dart';
import 'package:bloc_skeleton_project/core/error/failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorHandler', () {
    test('maps ServerException to ServerFailure', () {
      final failure = ErrorHandler.handleError(ServerException('server'));
      expect(failure, isA<ServerFailure>());
      expect(failure.message, 'server');
    });

    test('maps DioException timeout to NetworkFailure', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.connectionTimeout,
      );

      final failure = ErrorHandler.handleError(dioException);
      expect(failure, isA<NetworkFailure>());
    });
  });
}
