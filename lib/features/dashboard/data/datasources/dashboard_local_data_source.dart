import 'package:injectable/injectable.dart';

import '../../../../core/database/database.dart';
import '../models/shop_model.dart';
import '../models/shop_page_cache_row_model.dart';
import '../models/shops_page_model.dart';

abstract class DashboardLocalDataSource {
  Future<void> cacheShopsPage(
    ShopsPageModel pageData, {
    required int requestedPage,
    required int requestedPerPage,
  });

  Future<List<ShopModel>> queryShops({
    String? search,
    bool? isActive,
    int? minSqft,
    int limit,
    int offset,
  });

  Future<List<ShopPageCacheRowModel>> queryShopsWithPageJoin({
    int? page,
    int? perPage,
    String? search,
    bool? isActive,
    int limit,
    int offset,
  });
}

@LazySingleton(as: DashboardLocalDataSource)
class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final AppDatabase database;

  DashboardLocalDataSourceImpl(this.database);

  @override
  Future<void> cacheShopsPage(
    ShopsPageModel pageData, {
    required int requestedPage,
    required int requestedPerPage,
  }) {
    return database.cacheShopsPage(
      pageData,
      requestedPage: requestedPage,
      requestedPerPage: requestedPerPage,
    );
  }

  @override
  Future<List<ShopModel>> queryShops({
    String? search,
    bool? isActive,
    int? minSqft,
    int limit = 50,
    int offset = 0,
  }) async {
    final rows = await database.queryShopRecords(
      search: search,
      isActive: isActive,
      minSqft: minSqft,
      limit: limit,
      offset: offset,
    );

    return rows
        .map(
          (row) => ShopModel(
            id: row.id,
            shopNo: row.shopNo,
            ownerName: row.ownerName,
            ownerNid: row.ownerNid,
            ownerPhone: row.ownerPhone,
            sqft: row.sqft,
            meterNo: row.meterNo,
            isActive: row.isActive,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
            deletedAt: row.deletedAt,
          ),
        )
        .toList();
  }

  @override
  Future<List<ShopPageCacheRowModel>> queryShopsWithPageJoin({
    int? page,
    int? perPage,
    String? search,
    bool? isActive,
    int limit = 50,
    int offset = 0,
  }) async {
    final rows = await database.queryShopRecordsWithPageJoin(
      page: page,
      perPage: perPage,
      search: search,
      isActive: isActive,
      limit: limit,
      offset: offset,
    );

    return rows
        .map(
          (row) => ShopPageCacheRowModel(
            shop: ShopModel(
              id: row.shop.id,
              shopNo: row.shop.shopNo,
              ownerName: row.shop.ownerName,
              ownerNid: row.shop.ownerNid,
              ownerPhone: row.shop.ownerPhone,
              sqft: row.shop.sqft,
              meterNo: row.shop.meterNo,
              isActive: row.shop.isActive,
              createdAt: row.shop.createdAt,
              updatedAt: row.shop.updatedAt,
              deletedAt: row.shop.deletedAt,
            ),
            page: row.page,
            perPage: row.perPage,
            sortOrder: row.sortOrder,
            cachedAt: row.cachedAt,
          ),
        )
        .toList();
  }
}
