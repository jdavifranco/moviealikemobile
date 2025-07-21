import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';

part 'watch_list_state.g.dart';

@CopyWith()
class WatchListState {
  final List<WatchlistMovie> movies;
  final bool isLoading;
  final bool hasError;
  const WatchListState({
    this.movies = const [],
    this.isLoading = false,
    this.hasError = false,
  });
}
