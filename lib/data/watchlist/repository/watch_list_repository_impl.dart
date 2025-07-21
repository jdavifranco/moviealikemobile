import 'package:injectable/injectable.dart';
import 'package:moviealike/data/watchlist/datasource/watch_list_data_source.dart';
import 'package:moviealike/data/watchlist/models/watch_list_movie_dto.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';
import 'package:moviealike/domain/watchlist/repository/watch_list_repository.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

@Injectable(as: WatchListRepository)
class WatchListRepositoryImpl implements WatchListRepository {
  final WatchlistDataSource watchlistDataSource;

  WatchListRepositoryImpl(this.watchlistDataSource);

  @override
  Future<Result<void, RequestError>> addMovie(WatchlistMovie movie) async {
    return await watchlistDataSource
        .addMovie(WatchlistMovieDto.fromDomain(movie));
  }

  @override
  Future<void> deleteMovie(int movieId) {
    return watchlistDataSource.deleteMovie(movieId);
  }

  @override
  Future<Result<List<WatchlistMovie>, RequestError>> getAll() async {
    final result = await watchlistDataSource.getAllMovies();
    return result.map((dtos) => dtos.map((movie) => movie.toDomain()).toList());
  }

  @override
  Stream<List<WatchlistMovie>> getAllMoviesStream() {
    return watchlistDataSource
        .getAllMoviesStream()
        .map((movies) => movies.map((movie) => movie.toDomain()).toList());
  }

  @override
  Stream<bool> isMovieInWatchList(int movieId) {
    return watchlistDataSource.isMovieInWatchList(movieId);
  }
}
