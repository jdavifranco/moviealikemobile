import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/domain/movies/models/movie.dart';

import 'package:moviealike/domain/watchlist/use_cases/get_watch_list_stream.dart';
import 'package:moviealike/domain/watchlist/use_cases/remove_from_watch_list.dart';
import 'package:moviealike/presentation/screens/whatchlist/watch_list_state.dart';

class WatchListBloc extends Cubit<WatchListState> {
  final RemoveFromWatchList _removeFromWatchList;
  final GetWatchListStream _getWatchListStream;
  WatchListBloc(
    this._removeFromWatchList,
    this._getWatchListStream,
  ) : super(const WatchListState());

  StreamSubscription? movieSubscription;
  StreamSubscription? favoriteSubscription;

  final popularMovies = <Movie>[];
  Future<void> init() async {
    emit(state.copyWith(
      isLoading: true,
    ));

    movieSubscription = _getWatchListStream().listen((movies) {
      emit(state.copyWith(
        movies: movies,
        isLoading: false,
      ));
    });
  }

  Future<void> onRemoveFromWatchList(int movieId) async {
    await _removeFromWatchList(movieId);
  }

  @override
  Future<void> close() {
    movieSubscription?.cancel();
    return super.close();
  }
}
