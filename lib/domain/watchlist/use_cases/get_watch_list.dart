// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';
import 'package:moviealike/domain/watchlist/repository/watch_list_repository.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetWatchList {
  final WatchListRepository _watchListRepository;

  GetWatchList(
    this._watchListRepository,
  );

  Future<Result<List<WatchlistMovie>, RequestError>> call() =>
      _watchListRepository.getAll();
}
