import 'package:drift/drift.dart';
import 'package:moviealike/data/watchlist/models/watch_list_movie_dto.dart';
import 'package:moviealike/data/watchlist/models/watch_list_movies.dart';
part 'app_database.g.dart';

@DriftDatabase(
  tables: [WatchlistMoviesTable],
)
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase(QueryExecutor executor) : super(executor);

  @override
  int get schemaVersion => 1;
  static const databaseBaseName = 'moviealike.sqlite';
}
