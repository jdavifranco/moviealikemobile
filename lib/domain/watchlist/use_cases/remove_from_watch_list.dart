// coverage:ignore-file

import 'package:injectable/injectable.dart';
import 'package:moviealike/domain/watchlist/repository/watch_list_repository.dart';

@injectable
class RemoveFromWatchList {
  final WatchListRepository _watchListRepository;

  RemoveFromWatchList(
    this._watchListRepository,
  );

  Future<void> call(int movieId) => _watchListRepository.deleteMovie(movieId);
}
