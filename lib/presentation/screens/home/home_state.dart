import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/domain/series/models/serie.dart';
import 'package:moviealike/data/network_client/request_error.dart';

part 'home_state.g.dart';

@CopyWith()
class HomeState {
  final List<Movie> populaMovies;
  final bool isLoading;
  final String? backgroundImage;
  final List<Movie> upcomingMovies;
  final List<Serie> popularSeries;
  final List<Serie> upcomingSeries;
  final SearchType selectedType;
  final bool hasError;
  final RequestError? error;
  const HomeState({
    this.populaMovies = const [],
    this.isLoading = false,
    this.backgroundImage,
    this.upcomingMovies = const [],
    this.popularSeries = const [],
    this.upcomingSeries = const [],
    this.selectedType = SearchType.movie,
    this.hasError = false,
    this.error,
  });
}
