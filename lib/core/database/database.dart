import 'dart:developer' as developer;

import 'package:drift/drift.dart';

import '../../features/dashboard/data/models/shops_page_model.dart';
import 'connection/connection.dart';

part 'tables/todos_table.dart';
part 'tables/dashboard_tables.dart';
part 'daos/todo_dao.dart';
part 'daos/dashboard_cache_dao.dart';
part 'database.g.dart';

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
}
