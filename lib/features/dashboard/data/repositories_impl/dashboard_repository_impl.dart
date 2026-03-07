import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/shop.dart';
import '../../domain/entities/shop_page_cache_row.dart';
import '../../domain/entities/shops_page.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_local_data_source.dart';
import '../datasources/dashboard_remote_data_source.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final DashboardLocalDataSource localDataSource;

  DashboardRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, ShopsPage>> getShops({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final model = await remoteDataSource.getShops(
        page: page,
        perPage: perPage,
      );

      await localDataSource.cacheShopsPage(
        model,
        requestedPage: page,
        requestedPerPage: perPage,
      );

      return Right(model.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<Shop>>> queryCachedShops({
    String? search,
    bool? isActive,
    int? minSqft,
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final models = await localDataSource.queryShops(
        search: search,
        isActive: isActive,
        minSqft: minSqft,
        limit: limit,
        offset: offset,
      );

      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<ShopPageCacheRow>>> queryCachedShopsWithPageJoin({
    int? page,
    int? perPage,
    String? search,
    bool? isActive,
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final rows = await localDataSource.queryShopsWithPageJoin(
        page: page,
        perPage: perPage,
        search: search,
        isActive: isActive,
        limit: limit,
        offset: offset,
      );

      return Right(rows.map((row) => row.toEntity()).toList());
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
