import 'package:bloc_skeleton_project/core/error/failures.dart';
import 'package:bloc_skeleton_project/features/meter_reading/domain/entities/reading.dart';
import 'package:dartz/dartz.dart';

abstract class MeterReadingRepository {
  Future<Either<Failure, Reading>> getReadings();

}