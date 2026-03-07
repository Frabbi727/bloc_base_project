import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../models/auth_response_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<void> logout();
  Future<UserModel> refreshToken(String refreshToken);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await dioClient.post<Map<String, dynamic>>(
      ApiConstants.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return _parseUser(response.data);
  }

  @override
  Future<void> logout() async {
    await dioClient.post(ApiConstants.logout);
  }

  @override
  Future<UserModel> refreshToken(String refreshToken) async {
    final response = await dioClient.post<Map<String, dynamic>>(
      ApiConstants.refreshToken,
      data: {
        'refreshToken': refreshToken,
      },
    );

    return _parseUser(response.data);
  }

  UserModel _parseUser(Map<String, dynamic>? data) {
    if (data == null) {
      throw ServerException('Invalid response');
    }

    if (data['user'] != null && data['token'] != null) {
      final response = AuthResponseModel.fromJson(data);
      return response.userWithToken;
    }

    throw ServerException('Invalid response');
  }
}
