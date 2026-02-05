import 'package:bloc_skeleton_project/core/constants/storage_constants.dart';
import 'package:bloc_skeleton_project/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:bloc_skeleton_project/features/auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('AuthLocalDataSource', () {
    late AuthLocalDataSourceImpl dataSource;
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      dataSource = AuthLocalDataSourceImpl(prefs);
    });

    test('caches and retrieves user', () async {
      final user = UserModel(id: '1', email: 'a@b.com', name: 'A');
      await dataSource.cacheUser(user);

      final cached = await dataSource.getCachedUser();
      expect(cached, isNotNull);
      expect(cached!.id, '1');
      expect(cached.email, 'a@b.com');
    });

    test('saves and reads token', () async {
      await dataSource.saveToken('token');
      final token = await dataSource.getToken();
      expect(token, 'token');
    });

    test('clears cache', () async {
      await prefs.setString(StorageConstants.authToken, 'token');
      await prefs.setString(StorageConstants.cachedUser, '{"id":"1","email":"a@b.com"}');

      await dataSource.clearCache();

      expect(prefs.getString(StorageConstants.authToken), isNull);
      expect(prefs.getString(StorageConstants.cachedUser), isNull);
    });
  });
}
