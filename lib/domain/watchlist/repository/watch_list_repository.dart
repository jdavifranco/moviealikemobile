import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

abstract class WatchListRepository {
  Future<Result<List<WatchlistMovie>, RequestError>> getAll();
  Future<Result<void, RequestError>> addMovie(WatchlistMovie movie);
  Future<void> deleteMovie(int movieId);
  Stream<List<WatchlistMovie>> getAllMoviesStream();
  Stream<bool> isMovieInWatchList(int movieId);
}
