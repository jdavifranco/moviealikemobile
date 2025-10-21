import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';
import 'package:moviealike/domain/watchlist/use_cases/get_watch_list_stream.dart';
import 'package:moviealike/domain/watchlist/use_cases/remove_from_watch_list.dart';
import 'package:moviealike/presentation/screens/whatchlist/watch_list_bloc.dart';
import 'package:moviealike/presentation/screens/whatchlist/watch_list_state.dart';

import '../../mocks/models/fake_watchlist_movie.dart';

class GetWatchListStreamMock extends Mock implements GetWatchListStream {
  static GetWatchListStreamMock dummy({List<WatchlistMovie>? movies}) {
    final mock = GetWatchListStreamMock();
    when(() => mock.call()).thenAnswer(
      (_) => Stream.value(movies ?? const []),
    );
    return mock;
  }
}

class RemoveFromWatchListMock extends Mock implements RemoveFromWatchList {
  static RemoveFromWatchListMock dummy() {
    final mock = RemoveFromWatchListMock();
    when(() => mock.call(any())).thenAnswer(
      (_) async {},
    );
    return mock;
  }
}

void main() {
  registerFallbackValue(getFakeWatchlistMovie());

  WatchListBloc getWatchListBloc({
    GetWatchListStream? getWatchListStream,
    RemoveFromWatchList? removeFromWatchList,
  }) {
    return WatchListBloc(
      removeFromWatchList ?? RemoveFromWatchListMock.dummy(),
      getWatchListStream ?? GetWatchListStreamMock.dummy(),
    );
  }

  group('WatchListBloc', () {
    group('init', () {
      group('when getWatchListStream returns movies', () {
        final movies = [
          getFakeWatchlistMovie(
            movieId: 1,
            title: 'Test Movie 1',
            genre: 'Action',
            rating: 8.5,
            releaseYear: '2023',
            posterUrl: 'poster1.jpg',
          ),
          getFakeWatchlistMovie(
            movieId: 2,
            title: 'Test Movie 2',
            genre: 'Comedy',
            rating: 7.2,
            releaseYear: '2022',
            posterUrl: 'poster2.jpg',
          ),
        ];
        final getWatchListStreamMock =
            GetWatchListStreamMock.dummy(movies: movies);

        final watchListBloc = getWatchListBloc(
          getWatchListStream: getWatchListStreamMock,
        );

        blocTest<WatchListBloc, WatchListState>(
          'emits loading state then success state with movies',
          build: () => watchListBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<WatchListState>()
                .having((state) => state.isLoading, 'isLoading', isTrue)
                .having((state) => state.movies, 'movies', isEmpty),
            isA<WatchListState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.movies.length, 'movies length', 2)
                .having((state) => state.movies.first.title,
                    'first movie title', 'Test Movie 1')
                .having((state) => state.movies.last.title, 'last movie title',
                    'Test Movie 2'),
          ],
        );
      });

      group('when getWatchListStream returns empty list', () {
        final getWatchListStreamMock = GetWatchListStreamMock.dummy(movies: []);

        final watchListBloc = getWatchListBloc(
          getWatchListStream: getWatchListStreamMock,
        );

        blocTest<WatchListBloc, WatchListState>(
          'emits loading state then success state with empty movies list',
          build: () => watchListBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<WatchListState>()
                .having((state) => state.isLoading, 'isLoading', isTrue)
                .having((state) => state.movies, 'movies', isEmpty),
            isA<WatchListState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.movies, 'movies', isEmpty),
          ],
        );
      });

      group('when getWatchListStream emits multiple updates', () {
        final movies1 = [
          getFakeWatchlistMovie(movieId: 1, title: 'Movie 1'),
        ];
        final movies2 = [
          getFakeWatchlistMovie(movieId: 1, title: 'Movie 1'),
          getFakeWatchlistMovie(movieId: 2, title: 'Movie 2'),
        ];

        final getWatchListStreamMock = GetWatchListStreamMock();
        final streamController = StreamController<List<WatchlistMovie>>();

        when(() => getWatchListStreamMock.call()).thenAnswer(
          (_) => streamController.stream,
        );

        final watchListBloc = getWatchListBloc(
          getWatchListStream: getWatchListStreamMock,
        );

        blocTest<WatchListBloc, WatchListState>(
          'emits multiple states as stream updates',
          build: () => watchListBloc,
          act: (bloc) async {
            await bloc.init();
            streamController.add(movies1);
            await Future.delayed(const Duration(milliseconds: 100));
            streamController.add(movies2);
            await Future.delayed(const Duration(milliseconds: 100));
            streamController.close();
          },
          expect: () => [
            isA<WatchListState>()
                .having((state) => state.isLoading, 'isLoading', isTrue)
                .having((state) => state.movies, 'movies', isEmpty),
            isA<WatchListState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.movies.length, 'movies length', 1)
                .having((state) => state.movies.last.title, 'last movie title',
                    'Movie 1'),
            isA<WatchListState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.movies.length, 'movies length', 2)
                .having((state) => state.movies.last.title, 'last movie title',
                    'Movie 2'),
          ],
        );
      });
    });

    group('onRemoveFromWatchList', () {
      group('when removeFromWatchList succeeds', () {
        final removeFromWatchListMock = RemoveFromWatchListMock.dummy();

        final watchListBloc = getWatchListBloc(
          removeFromWatchList: removeFromWatchListMock,
        );

        blocTest<WatchListBloc, WatchListState>(
          'calls removeFromWatchList with correct movieId',
          build: () => watchListBloc,
          act: (bloc) => bloc.onRemoveFromWatchList(123),
          verify: (bloc) {
            verify(() => removeFromWatchListMock(123)).called(1);
          },
        );
      });

      group('when removeFromWatchList is called multiple times', () {
        final removeFromWatchListMock = RemoveFromWatchListMock.dummy();

        final watchListBloc = getWatchListBloc(
          removeFromWatchList: removeFromWatchListMock,
        );

        blocTest<WatchListBloc, WatchListState>(
          'calls removeFromWatchList multiple times with different movieIds',
          build: () => watchListBloc,
          act: (bloc) async {
            await bloc.onRemoveFromWatchList(123);
            await bloc.onRemoveFromWatchList(456);
            await bloc.onRemoveFromWatchList(789);
          },
          verify: (bloc) {
            verify(() => removeFromWatchListMock(123)).called(1);
            verify(() => removeFromWatchListMock(456)).called(1);
            verify(() => removeFromWatchListMock(789)).called(1);
          },
        );
      });
    });
  });
}
