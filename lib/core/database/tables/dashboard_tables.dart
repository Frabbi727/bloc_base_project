part of 'package:bloc_skeleton_project/core/database/database.dart';

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
