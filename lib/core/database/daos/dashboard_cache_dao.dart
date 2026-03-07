part of 'package:bloc_skeleton_project/core/database/database.dart';

class ShopPageJoinRow {
  final ShopRecord shop;
  final int page;
  final int perPage;
  final int sortOrder;
  final DateTime cachedAt;

  const ShopPageJoinRow({
    required this.shop,
    required this.page,
    required this.perPage,
    required this.sortOrder,
    required this.cachedAt,
  });
}

extension DashboardCacheDatabaseX on AppDatabase {
  Future<void> cacheShopsPage(
    ShopsPageModel pageData, {
    required int requestedPage,
    required int requestedPerPage,
  }) async {
    await transaction(() async {
      await into(shopPageCacheRecords).insertOnConflictUpdate(
        ShopPageCacheRecordsCompanion.insert(
          page: requestedPage,
          perPage: requestedPerPage,
          currentPage: pageData.currentPage,
          firstPageUrl: pageData.firstPageUrl,
          lastPage: pageData.lastPage,
          lastPageUrl: pageData.lastPageUrl,
          path: pageData.path,
          total: pageData.total,
          fromItem: Value(pageData.from),
          nextPageUrl: Value(pageData.nextPageUrl),
          prevPageUrl: Value(pageData.prevPageUrl),
          toItem: Value(pageData.to),
        ),
      );

      await batch((batch) {
        batch.insertAllOnConflictUpdate(
          shopRecords,
          pageData.data
              .map(
                (shop) => ShopRecordsCompanion.insert(
                  id: Value(shop.id),
                  shopNo: shop.shopNo,
                  ownerName: shop.ownerName,
                  isActive: shop.isActive,
                  ownerNid: Value(shop.ownerNid),
                  ownerPhone: Value(shop.ownerPhone),
                  sqft: Value(shop.sqft),
                  meterNo: Value(shop.meterNo),
                  createdAt: Value(shop.createdAt),
                  updatedAt: Value(shop.updatedAt),
                  deletedAt: Value(shop.deletedAt),
                ),
              )
              .toList(),
        );
      });

      await (delete(shopPageItemRecords)..where(
            (t) =>
                t.page.equals(requestedPage) &
                t.perPage.equals(requestedPerPage),
          ))
          .go();

      if (pageData.data.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            shopPageItemRecords,
            pageData.data
                .asMap()
                .entries
                .map(
                  (entry) => ShopPageItemRecordsCompanion.insert(
                    page: requestedPage,
                    perPage: requestedPerPage,
                    shopId: entry.value.id,
                    sortOrder: entry.key,
                  ),
                )
                .toList(),
          );
        });
      }

      await (delete(shopPageLinkRecords)..where(
            (t) =>
                t.page.equals(requestedPage) &
                t.perPage.equals(requestedPerPage),
          ))
          .go();

      if (pageData.links.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            shopPageLinkRecords,
            pageData.links
                .asMap()
                .entries
                .map(
                  (entry) => ShopPageLinkRecordsCompanion.insert(
                    page: requestedPage,
                    perPage: requestedPerPage,
                    sortOrder: entry.key,
                    label: entry.value.label,
                    active: entry.value.active,
                    url: Value(entry.value.url),
                    pageNo: Value(entry.value.page),
                  ),
                )
                .toList(),
          );
        });
      }
    });

    developer.log(
      'Dashboard cache saved: page=$requestedPage, perPage=$requestedPerPage, shops=${pageData.data.length}, links=${pageData.links.length}',
      name: 'database',
    );
  }

  Future<List<ShopRecord>> queryShopRecords({
    String? search,
    bool? isActive,
    int? minSqft,
    int limit = 50,
    int offset = 0,
  }) async {
    final query = select(shopRecords);

    final normalizedSearch = search?.trim();
    if (normalizedSearch != null && normalizedSearch.isNotEmpty) {
      query.where(
        (t) =>
            t.shopNo.like('%$normalizedSearch%') |
            t.ownerName.like('%$normalizedSearch%') |
            t.ownerPhone.like('%$normalizedSearch%'),
      );
    }

    if (isActive != null) {
      query.where((t) => t.isActive.equals(isActive));
    }

    if (minSqft != null) {
      query.where((t) => t.sqft.isBiggerOrEqualValue(minSqft));
    }

    query
      ..orderBy([(t) => OrderingTerm.asc(t.shopNo)])
      ..limit(limit, offset: offset);

    return query.get();
  }

  Future<List<ShopPageJoinRow>> queryShopRecordsWithPageJoin({
    int? page,
    int? perPage,
    String? search,
    bool? isActive,
    int limit = 50,
    int offset = 0,
  }) async {
    final joinQuery = select(shopPageItemRecords).join([
      innerJoin(
        shopRecords,
        shopRecords.id.equalsExp(shopPageItemRecords.shopId),
      ),
      innerJoin(
        shopPageCacheRecords,
        shopPageCacheRecords.page.equalsExp(shopPageItemRecords.page) &
            shopPageCacheRecords.perPage.equalsExp(shopPageItemRecords.perPage),
      ),
    ]);

    if (page != null) {
      joinQuery.where(shopPageItemRecords.page.equals(page));
    }

    if (perPage != null) {
      joinQuery.where(shopPageItemRecords.perPage.equals(perPage));
    }

    final normalizedSearch = search?.trim();
    if (normalizedSearch != null && normalizedSearch.isNotEmpty) {
      joinQuery.where(
        shopRecords.shopNo.like('%$normalizedSearch%') |
            shopRecords.ownerName.like('%$normalizedSearch%') |
            shopRecords.ownerPhone.like('%$normalizedSearch%'),
      );
    }

    if (isActive != null) {
      joinQuery.where(shopRecords.isActive.equals(isActive));
    }

    joinQuery
      ..orderBy([
        OrderingTerm.asc(shopPageItemRecords.page),
        OrderingTerm.asc(shopPageItemRecords.sortOrder),
      ])
      ..limit(limit, offset: offset);

    final rows = await joinQuery.get();

    return rows
        .map(
          (row) => ShopPageJoinRow(
            shop: row.readTable(shopRecords),
            page: row.readTable(shopPageItemRecords).page,
            perPage: row.readTable(shopPageItemRecords).perPage,
            sortOrder: row.readTable(shopPageItemRecords).sortOrder,
            cachedAt: row.readTable(shopPageCacheRecords).cachedAt,
          ),
        )
        .toList();
  }
}
