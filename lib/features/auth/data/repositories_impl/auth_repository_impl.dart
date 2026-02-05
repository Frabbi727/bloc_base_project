import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      this.remoteDataSource,
      this.localDataSource,
      this.networkInfo,
      );

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    // Check internet connectivity
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }

    try {
      final userModel = await remoteDataSource.login(email, password);

      // Cache user and token locally
      await localDataSource.cacheUser(userModel);
      if (userModel.token != null) {
        await localDataSource.saveToken(userModel.token!);
      }
      if (userModel.refreshToken != null) {
        await localDataSource.saveRefreshToken(userModel.refreshToken!);
      }

      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.logout();
      }
      await localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final cachedUser = await localDataSource.getCachedUser();
      return Right(cachedUser?.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
