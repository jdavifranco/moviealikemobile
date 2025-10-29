import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/domain/movies/use_cases/get_popular_movies.dart';
import 'package:moviealike/domain/movies/use_cases/get_upcoming_movies.dart';
import 'package:moviealike/presentation/screens/home/home_bloc.dart';
import 'package:moviealike/presentation/screens/home/home_state.dart';
import 'package:result_type/result_type.dart';

import '../../mocks/models/fake_movie.dart';

class MockGetPopularMovies extends Mock implements GetPopularMovies {}

class MockGetUpcomingMovies extends Mock implements GetUpcomingMovies {}

void main() {
  group('HomeBloc', () {
    group('init', () {
      group('when requests are successful', () {
        final mockGetPopularMovies = MockGetPopularMovies();
        final mockGetUpcomingMovies = MockGetUpcomingMovies();
        final homeBloc = HomeBloc(mockGetPopularMovies, mockGetUpcomingMovies);

        late List<Movie> popularMovies;
        late List<Movie> upcomingMovies;

        popularMovies = [
          getFakeMovie(
            id: 1,
            title: 'Popular Movie 1',
            overview: 'Overview 1',
          ),
          getFakeMovie(
            id: 2,
            title: 'Popular Movie 2',
            overview: 'Overview 2',
          ),
        ];

        upcomingMovies = [
          getFakeMovie(
            id: 3,
            title: 'Upcoming Movie 1',
            overview: 'Upcoming Overview 1',
          ),
          getFakeMovie(
            id: 4,
            title: 'Upcoming Movie 2',
            overview: 'Upcoming Overview 2',
          ),
        ];

        when(() => mockGetPopularMovies()).thenAnswer(
          (_) async => Success(popularMovies),
        );
        when(() => mockGetUpcomingMovies()).thenAnswer(
          (_) async => Success(upcomingMovies),
        );

        blocTest<HomeBloc, HomeState>(
          'emits correct state when both use cases return success',
          build: () => homeBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<HomeState>()
                .having((state) => state.isLoading, 'isLoading', isTrue)
                .having((state) => state.hasError, 'hasError', isFalse)
                .having((state) => state.error, 'error', isNull),
            isA<HomeState>()
                .having((state) => state.populaMovies.length, 'populaMovies loaded', 2)
                .having((state) => state.upcomingMovies.length, 'upcomingMovies loaded', 2)
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.hasError, 'hasError', isFalse)
                .having((state) => state.error, 'error', isNull)
                .having((state) => state.populaMovies.first.title, 'first popular movie title', 'Popular Movie 1')
                .having((state) => state.upcomingMovies.first.title, 'first upcoming movie title', 'Upcoming Movie 2'),
          ],
        );
      });

      group('when getPopularMovies fails', () {
        final mockGetPopularMovies = MockGetPopularMovies();
        final mockGetUpcomingMovies = MockGetUpcomingMovies();
        final homeBloc = HomeBloc(mockGetPopularMovies, mockGetUpcomingMovies);
        late ServerError error;
        late List<Movie> upcomingMovies;

        error = ServerError(statusCode: 500);
        upcomingMovies = [
          getFakeMovie(
            id: 3,
            title: 'Upcoming Movie 1',
            overview: 'Upcoming Overview 1',
          ),
        ];

        when(() => mockGetPopularMovies()).thenAnswer(
          (_) async => Failure(error),
        );
        when(() => mockGetUpcomingMovies()).thenAnswer(
          (_) async => Success(upcomingMovies),
        );

        blocTest<HomeBloc, HomeState>(
          'emits error state when getPopularMovies fails',
          build: () => homeBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            // Loading state
            isA<HomeState>()
                .having((state) => state.isLoading, 'isLoading', isTrue)
                .having((state) => state.hasError, 'hasError', isFalse)
                .having((state) => state.error, 'error', isNull),
            // Error state
            isA<HomeState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.hasError, 'hasError', isTrue)
                .having((state) => state.error, 'error', isA<ServerError>()),
          ],
        );
      });

      group('when getUpcomingMovies fails', () {
        final mockGetPopularMovies = MockGetPopularMovies();
        final mockGetUpcomingMovies = MockGetUpcomingMovies();
        final homeBloc = HomeBloc(mockGetPopularMovies, mockGetUpcomingMovies);
        late ConnectionError error;
        late List<Movie> popularMovies;

        error = ConnectionError();
        popularMovies = [
          getFakeMovie(
            id: 1,
            title: 'Popular Movie 1',
            overview: 'Overview 1',
            posterPath: '/poster1.jpg',
            backdropPath: '/backdrop1.jpg',
            releaseDate: '2023-01-01',
            voteAverage: 8.5,
            voteCount: 1000,
          ),
        ];

        when(() => mockGetPopularMovies()).thenAnswer(
          (_) async => Success(popularMovies),
        );
        when(() => mockGetUpcomingMovies()).thenAnswer(
          (_) async => Failure(error),
        );

        blocTest<HomeBloc, HomeState>(
          'emits error state when getUpcomingMovies fails',
          build: () => homeBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            // Loading state
            isA<HomeState>()
                .having((state) => state.isLoading, 'isLoading', isTrue)
                .having((state) => state.hasError, 'hasError', isFalse)
                .having((state) => state.error, 'error', isNull),
            // Error state
            isA<HomeState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.hasError, 'hasError', isTrue)
                .having((state) => state.error, 'error', isA<ConnectionError>()),
          ],
        );
      });

      group('when both use cases fail', () {
        final mockGetPopularMovies = MockGetPopularMovies();
        final mockGetUpcomingMovies = MockGetUpcomingMovies();
        final homeBloc = HomeBloc(mockGetPopularMovies, mockGetUpcomingMovies);
        late ServerError popularMoviesError;
        late ConnectionError upcomingMoviesError;

        popularMoviesError = ServerError(statusCode: 500);
        upcomingMoviesError = ConnectionError();

        when(() => mockGetPopularMovies()).thenAnswer(
          (_) async => Failure(popularMoviesError),
        );
        when(() => mockGetUpcomingMovies()).thenAnswer(
          (_) async => Failure(upcomingMoviesError),
        );

        blocTest<HomeBloc, HomeState>(
          'emits error state when both use cases fail',
          build: () => homeBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            // Loading state
            isA<HomeState>()
                .having((state) => state.isLoading, 'isLoading', isTrue)
                .having((state) => state.hasError, 'hasError', isFalse)
                .having((state) => state.error, 'error', isNull),
            // Error state (should use popularMoviesError as it's checked first)
            isA<HomeState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.hasError, 'hasError', isTrue)
                .having((state) => state.error, 'error', isA<ServerError>()),
          ],
        );
      });
    });
  });
}
