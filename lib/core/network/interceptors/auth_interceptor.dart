import 'package:bloc_skeleton_project/core/constants/api_constants.dart';
import 'package:bloc_skeleton_project/core/di/injection.dart';
import 'package:bloc_skeleton_project/core/network/dio_client.dart';
import 'package:bloc_skeleton_project/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:bloc_skeleton_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final localDataSource = getIt<AuthLocalDataSource>();
    final token = await localDataSource.getToken();
    if (token != null) {
      options.headers[ApiConstants.authorization] = ApiConstants.bearer(token);
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final skipRefresh = err.requestOptions.extra['skipAuthRefresh'] == true;
    if (err.response?.statusCode == 401 && !skipRefresh) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        // Retry original request
        try {
          final response = await _retry(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          // Refresh failed, logout user
          await _logout();
        }
      } else {
        await _logout();
      }
    }

    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    final localDataSource = getIt<AuthLocalDataSource>();
    final remoteDataSource = getIt<AuthRemoteDataSource>();
    final refreshToken = await localDataSource.getRefreshToken();
    if (refreshToken == null) {
      return false;
    }

    try {
      final user = await remoteDataSource.refreshToken(refreshToken);
      if (user.token != null) {
        await localDataSource.saveToken(user.token!);
      }
      if (user.refreshToken != null) {
        await localDataSource.saveRefreshToken(user.refreshToken!);
      }
      await localDataSource.cacheUser(user);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final localDataSource = getIt<AuthLocalDataSource>();
    final token = await localDataSource.getToken();

    if (token != null) {
      requestOptions.headers[ApiConstants.authorization] =
          ApiConstants.bearer(token);
    }
    requestOptions.extra['skipAuthRefresh'] = true;

    final dio = getIt<DioClient>().dio;
    return dio.fetch(requestOptions);
  }

  Future<void> _logout() async {
    final localDataSource = getIt<AuthLocalDataSource>();
    await localDataSource.clearCache();
    // Navigate to login screen
  }
}
