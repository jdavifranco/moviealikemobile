import 'package:drift/drift.dart';
import 'package:moviealike/data/watchlist/models/watch_list_movie_dto.dart';

@UseRowClass(WatchlistMovieDto)
class WatchlistMoviesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer()();
  TextColumn get title => text()();
  TextColumn get genre => text()();
  RealColumn get rating => real()();
  TextColumn get releaseYear => text()();
  TextColumn get posterUrl => text()();
}
