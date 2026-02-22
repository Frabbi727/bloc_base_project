import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/shops_page.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

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
      return Right(model.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
