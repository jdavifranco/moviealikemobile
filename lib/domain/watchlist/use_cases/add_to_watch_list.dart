// coverage:ignore-file

import 'package:injectable/injectable.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';
import 'package:moviealike/domain/watchlist/repository/watch_list_repository.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

@injectable
class AddToWatchList {
  final WatchListRepository _watchListRepository;

  AddToWatchList(
    this._watchListRepository,
  );

  Future<Result<void, RequestError>> call(WatchlistMovie movie) =>
      _watchListRepository.addMovie(movie);
}
