import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/storage_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveRefreshToken(String refreshToken);
  Future<String?> getRefreshToken();
  Future<void> clearCache();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheUser(UserModel user) async {
    final jsonString = jsonEncode(user.toJson());
    final success =
        await sharedPreferences.setString(StorageConstants.cachedUser, jsonString);
    if (!success) {
      throw CacheException('Failed to cache user');
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final jsonString = sharedPreferences.getString(StorageConstants.cachedUser);
    if (jsonString == null) {
      return null;
    }
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return UserModel.fromJson(jsonMap);
  }

  @override
  Future<void> saveToken(String token) async {
    final success =
        await sharedPreferences.setString(StorageConstants.authToken, token);
    if (!success) {
      throw CacheException('Failed to save token');
    }
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(StorageConstants.authToken);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    final success = await sharedPreferences.setString(
      StorageConstants.refreshToken,
      refreshToken,
    );
    if (!success) {
      throw CacheException('Failed to save refresh token');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    return sharedPreferences.getString(StorageConstants.refreshToken);
  }

  @override
  Future<void> clearCache() async {
    await sharedPreferences.remove(StorageConstants.cachedUser);
    await sharedPreferences.remove(StorageConstants.authToken);
    await sharedPreferences.remove(StorageConstants.refreshToken);
  }
}
