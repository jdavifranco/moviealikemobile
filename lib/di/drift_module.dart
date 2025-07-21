import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/database/app_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

@module
abstract class DriftModule {
  @preResolve
  @singleton
  Future<AppDatabase> openConnection() async {
    final queryExecutor = _getNativeQueryExecutor();

    return AppDatabase(queryExecutor);
  }
}

QueryExecutor _getNativeQueryExecutor() {
  return LazyDatabase(() async {
    final internalDocuments = await getApplicationDocumentsDirectory();
    final file =
        File(join(internalDocuments.path, AppDatabase.databaseBaseName));
    return NativeDatabase(file);
  });
}

//For web support
// QueryExecutor getWebQueryExecutor() {
//   return DatabaseConnection.delayed(Future(() async {
//     final database = await WasmDatabase.open(
//       databaseName: AppDatabase.databaseBaseName,
//       sqlite3Uri: Uri.parse('sqlite3.wasm'),
//       driftWorkerUri: Uri.parse('drift_worker.js'),
//     );
//     return database.resolvedExecutor;
//   }));
// }
