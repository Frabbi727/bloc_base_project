// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_skeleton_project/core/di/injection.dart' as _i663;
import 'package:bloc_skeleton_project/core/network/dio_client.dart' as _i238;
import 'package:bloc_skeleton_project/core/network/network_info.dart' as _i29;
import 'package:bloc_skeleton_project/features/auth/data/datasources/auth_local_data_source.dart'
    as _i349;
import 'package:bloc_skeleton_project/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i332;
import 'package:bloc_skeleton_project/features/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i589;
import 'package:bloc_skeleton_project/features/auth/domain/repositories/auth_repository.dart'
    as _i586;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i238.DioClient>(() => _i238.DioClient());
    gh.lazySingleton<_i29.NetworkInfo>(
      () => _i29.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i332.AuthRemoteDataSource>(
      () => _i332.AuthRemoteDataSourceImpl(gh<_i238.DioClient>()),
    );
    gh.lazySingleton<_i349.AuthLocalDataSource>(
      () => _i349.AuthLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i586.AuthRepository>(
      () => _i589.AuthRepositoryImpl(
        gh<_i332.AuthRemoteDataSource>(),
        gh<_i349.AuthLocalDataSource>(),
        gh<_i29.NetworkInfo>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i663.RegisterModule {}
