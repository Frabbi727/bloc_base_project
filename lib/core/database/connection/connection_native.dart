import 'dart:developer' as developer;
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

QueryExecutor openConnection() {
  if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
    return _openSqfliteConnection();
  }

  return _openNativeConnection();
}

QueryExecutor _openSqfliteConnection() {
  const dbName = 'app_database.sqlite';
  developer.log('Drift DB backend: sqflite, file: $dbName', name: 'database');
  return SqfliteQueryExecutor.inDatabaseFolder(path: dbName);
}

QueryExecutor _openNativeConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    developer.log(
      'Drift DB backend: native, path: ${file.path}',
      name: 'database',
    );
    return NativeDatabase.createInBackground(file);
  });
}
