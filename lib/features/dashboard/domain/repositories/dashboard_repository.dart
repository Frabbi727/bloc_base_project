import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/shops_page.dart';

abstract class DashboardRepository {
  Future<Either<Failure, ShopsPage>> getShops({
    int page = 1,
    int perPage = 10,
  });
}
