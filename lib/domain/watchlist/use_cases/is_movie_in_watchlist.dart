// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/domain/watchlist/repository/watch_list_repository.dart';

@injectable
class IsMovieInWatchList {
  final WatchListRepository _watchListRepository;

  IsMovieInWatchList(
    this._watchListRepository,
  );

  Stream<bool> call(int movieId) =>
      _watchListRepository.isMovieInWatchList(movieId);
}
