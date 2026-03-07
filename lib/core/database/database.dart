import 'dart:developer' as developer;

import 'package:drift/drift.dart';

import '../../features/dashboard/data/models/shops_page_model.dart';
import 'connection/connection.dart';

part 'database.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 255)();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class ShopRecords extends Table {
  IntColumn get id => integer()();

  TextColumn get shopNo => text()();

  TextColumn get ownerName => text()();

  TextColumn get ownerNid => text().nullable()();

  TextColumn get ownerPhone => text().nullable()();

  IntColumn get sqft => integer().nullable()();

  TextColumn get meterNo => text().nullable()();

  BoolColumn get isActive => boolean()();

  TextColumn get createdAt => text().nullable()();

  TextColumn get updatedAt => text().nullable()();

  TextColumn get deletedAt => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ShopPageCacheRecords extends Table {
  IntColumn get page => integer()();

  IntColumn get perPage => integer()();

  IntColumn get currentPage => integer()();

  TextColumn get firstPageUrl => text()();

  IntColumn get fromItem => integer().nullable()();

  IntColumn get lastPage => integer()();

  TextColumn get lastPageUrl => text()();

  TextColumn get nextPageUrl => text().nullable()();

  TextColumn get path => text()();

  TextColumn get prevPageUrl => text().nullable()();

  IntColumn get toItem => integer().nullable()();

  IntColumn get total => integer()();

  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {page, perPage};
}

class ShopPageItemRecords extends Table {
  IntColumn get page => integer()();

  IntColumn get perPage => integer()();

  IntColumn get shopId => integer().references(ShopRecords, #id)();

  IntColumn get sortOrder => integer()();

  @override
  Set<Column<Object>> get primaryKey => {page, perPage, shopId};
}

class ShopPageLinkRecords extends Table {
  IntColumn get page => integer()();

  IntColumn get perPage => integer()();

  IntColumn get sortOrder => integer()();

  TextColumn get label => text()();

  TextColumn get url => text().nullable()();

  IntColumn get pageNo => integer().nullable()();

  BoolColumn get active => boolean()();

  @override
  Set<Column<Object>> get primaryKey => {page, perPage, sortOrder};
}

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

@DriftDatabase(
  tables: [
    Todos,
    ShopRecords,
    ShopPageCacheRecords,
    ShopPageItemRecords,
    ShopPageLinkRecords,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(shopRecords);
        await m.createTable(shopPageCacheRecords);
        await m.createTable(shopPageItemRecords);
        await m.createTable(shopPageLinkRecords);
      }
    },
  );

  Future<int> createTodo(String title) {
    return into(todos).insert(TodosCompanion.insert(title: title));
  }

  Future<List<Todo>> getAllTodos() {
    return (select(
      todos,
    )..orderBy([(t) => OrderingTerm.asc(t.createdAt)])).get();
  }

  Stream<List<Todo>> watchTodos() {
    return (select(
      todos,
    )..orderBy([(t) => OrderingTerm.asc(t.createdAt)])).watch();
  }

  Future<bool> toggleTodo(int id, bool completed) async {
    final rows = await (update(todos)..where((t) => t.id.equals(id))).write(
      TodosCompanion(completed: Value(completed)),
    );
    return rows > 0;
  }

  Future<bool> deleteTodoById(int id) async {
    final rows = await (delete(todos)..where((t) => t.id.equals(id))).go();
    return rows > 0;
  }

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
