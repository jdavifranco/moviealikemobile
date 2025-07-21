// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';
import 'package:moviealike/domain/watchlist/repository/watch_list_repository.dart';

@injectable
class GetWatchListStream {
  final WatchListRepository _watchListRepository;

  GetWatchListStream(
    this._watchListRepository,
  );

  Stream<List<WatchlistMovie>> call() =>
      _watchListRepository.getAllMoviesStream();
}
