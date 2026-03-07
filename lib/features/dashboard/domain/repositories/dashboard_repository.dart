import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/shop.dart';
import '../entities/shop_page_cache_row.dart';
import '../entities/shops_page.dart';

abstract class DashboardRepository {
  Future<Either<Failure, ShopsPage>> getShops({int page = 1, int perPage = 10});

  Future<Either<Failure, List<Shop>>> queryCachedShops({
    String? search,
    bool? isActive,
    int? minSqft,
    int limit = 50,
    int offset = 0,
  });

  Future<Either<Failure, List<ShopPageCacheRow>>> queryCachedShopsWithPageJoin({
    int? page,
    int? perPage,
    String? search,
    bool? isActive,
    int limit = 50,
    int offset = 0,
  });
}
