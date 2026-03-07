import 'package:bloc_skeleton_project/core/error/failures.dart';
import 'package:bloc_skeleton_project/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:bloc_skeleton_project/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:bloc_skeleton_project/features/meter_reading/domain/entities/reading.dart';
import 'package:bloc_skeleton_project/features/meter_reading/domain/repositories/meter_reading_repository.dart';
import 'package:dartz/dartz.dart';

class MeterReadingRepositoryImpl extends MeterReadingRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final DashboardLocalDataSource localDataSource;


  MeterReadingRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, Reading>> getReadings() {
    // TODO: implement getReadings
    throw UnimplementedError();
  }
}