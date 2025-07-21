import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/domain/movies/use_cases/get_popular_movies.dart';
import 'package:moviealike/domain/movies/use_cases/get_upcoming_movies.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/presentation/screens/home/home_state.dart';
import 'package:moviealike/data/network_client/result_extensions.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetPopularMovies _getPopularMovies;
  final GetUpcomingMovies _getUpcomingMovies;

  HomeBloc(this._getPopularMovies, this._getUpcomingMovies)
      : super(const HomeState());

  void _emitLoadingState() {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      error: null,
    ));
  }

  void _emitErrorState(RequestError error) {
    emit(state.copyWith(
      isLoading: false,
      hasError: true,
      error: error,
    ));
  }

  void _emitSuccessState({
    required List<Movie> popularMovies,
    required List<Movie> upcomingMovies,
    SearchType? selectedType,
  }) {
    emit(state.copyWith(
      populaMovies: popularMovies,
      upcomingMovies: upcomingMovies.reversed.toList(),
      isLoading: false,
      hasError: false,
      error: null,
      selectedType: selectedType ?? state.selectedType,
    ));
  }

  Future<void> init() async {
    _emitLoadingState();
    final popularMoviesResult = await _getPopularMovies();
    final upcomingMoviesResult = await _getUpcomingMovies();
    final hasFailed =
        popularMoviesResult.isFailure || upcomingMoviesResult.isFailure;
    if (hasFailed) {
      _emitErrorState(
          popularMoviesResult.failureOrNull ?? upcomingMoviesResult.failure);
      return;
    }

    _emitSuccessState(
      popularMovies: popularMoviesResult.success,
      upcomingMovies: upcomingMoviesResult.success,
    );
  }
}
