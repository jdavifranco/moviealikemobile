import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/database/app_database.dart';
import 'package:moviealike/data/watchlist/models/watch_list_movie_dto.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

@injectable
class WatchlistDataSource {
  final AppDatabase _database;

  WatchlistDataSource(this._database);

  /// Add a movie to the watchlist
  Future<Result<void, RequestError>> addMovie(WatchlistMovieDto movie) async {
    try {
      await _database.into(_database.watchlistMoviesTable).insert(
            WatchlistMoviesTableCompanion.insert(
              movieId: movie.movieId,
              title: movie.title,
              genre: movie.genre,
              rating: movie.rating,
              releaseYear: movie.releaseYear,
              posterUrl: movie.posterUrl,
            ),
          );
      return Success(null);
    } catch (e) {
      return Failure(
          ServerError(statusCode: 500, data: {'message': e.toString()}));
    }
  }

  Future<Result<List<WatchlistMovieDto>, RequestError>> getAllMovies() async {
    try {
      final result = await _database.watchlistMoviesTable.select().get();
      return Success(result);
    } catch (e) {
      return Failure(
          ServerError(statusCode: 500, data: {'message': e.toString()}));
    }
  }

  Stream<List<WatchlistMovieDto>> getAllMoviesStream() {
    return _database.watchlistMoviesTable.select().watch();
  }

  Future<WatchlistMovieDto?> getMovieById(int movieId) async {
    final query = _database.select(_database.watchlistMoviesTable)
      ..where((tbl) => tbl.movieId.equals(movieId));
    final result = await query.getSingleOrNull();
    return result != null
        ? WatchlistMovieDto(
            movieId: result.movieId,
            title: result.title,
            genre: result.genre,
            rating: result.rating,
            releaseYear: result.releaseYear,
            posterUrl: result.posterUrl,
          )
        : null;
  }

  Future<void> updateMovie(WatchlistMovieDto movie) async {
    await _database.transaction(() async {
      await _database
          .into(_database.watchlistMoviesTable)
          .insertOnConflictUpdate(
            WatchlistMoviesTableCompanion.insert(
                movieId: movie.movieId,
                title: movie.title,
                genre: movie.genre,
                rating: movie.rating,
                releaseYear: movie.releaseYear,
                posterUrl: movie.posterUrl),
          );
    });
  }

  Future<void> deleteMovie(int movieId) async {
    return _database.transaction(() async {
      await (_database.delete(_database.watchlistMoviesTable)
            ..where((tbl) => tbl.movieId.equals(movieId)))
          .go();
    });
  }

  Stream<bool> isMovieInWatchList(int movieId) {
    return _database.watchlistMoviesTable
        .select()
        .watch()
        .map((movies) => movies.any((movie) => movie.movieId == movieId));
  }
}
