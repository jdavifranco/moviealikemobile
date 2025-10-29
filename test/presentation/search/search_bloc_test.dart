import 'package:async/async.dart' hide Result;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/domain/movies/use_cases/get_popular_movies.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/use_cases/search_movie_by_title.dart';
import 'package:moviealike/domain/search/use_cases/search_movie_with_filter.dart';
import 'package:moviealike/presentation/screens/search/search_bloc.dart';
import 'package:moviealike/presentation/screens/search/search_state.dart';
import 'package:result_type/result_type.dart';

import '../../mocks/models/fake_movie.dart';
import '../../mocks/models/fake_search_item.dart';

class SearchMovieByTitleMock extends Mock implements SearchMovieByTitle {
  static SearchMovieByTitleMock dummy({List<SearchItem>? searchItems, SearchType type = SearchType.movie}) {
    final mock = SearchMovieByTitleMock();
    when(() => mock.call(any(), type, any())).thenAnswer(
      (_) => CancelableOperation.fromFuture(
        Future.value(Success(searchItems ?? const [])),
      ),
    );
    return mock;
  }
}

class GetPopularMoviesMock extends Mock implements GetPopularMovies {
  static GetPopularMoviesMock dummy({List<Movie>? movies}) {
    final mock = GetPopularMoviesMock();
    when(() => mock.call()).thenAnswer(
      (_) async => Success(movies ?? const []),
    );
    return mock;
  }
}

class SearchMovieWithFilterMock extends Mock implements SearchMovieWithFilter {
  static SearchMovieWithFilterMock dummy(
      {List<SearchItem>? searchItems, SearchType type = SearchType.movie, SearchFilter filter = SearchFilter.genres}) {
    final mock = SearchMovieWithFilterMock();
    when(() => mock.call(
          query: any(named: 'query'),
          type: type,
          filter: filter,
          page: any(named: 'page'),
        )).thenAnswer(
      (_) => CancelableOperation.fromFuture(
        Future.value(Success(searchItems ?? const [])),
      ),
    );
    return mock;
  }
}

void main() {
  registerFallbackValue(getFakeMovie());
  registerFallbackValue(getFakeSearchItem());
  registerFallbackValue(SearchType.movie);
  registerFallbackValue(SearchFilter.genres);

  SearchBloc getSearchBloc({
    SearchMovieByTitle? searchMovieByTitle,
    GetPopularMovies? getPopularMovies,
    SearchMovieWithFilter? searchMovieWithFilter,
    SearchType initialSearchType = SearchType.movie,
  }) {
    return SearchBloc(
      searchMovieOrSeriesByTitle: searchMovieByTitle ?? SearchMovieByTitleMock.dummy(),
      getPopularMovies: getPopularMovies ?? GetPopularMoviesMock.dummy(),
      searchMovieWithFilter: searchMovieWithFilter ?? SearchMovieWithFilterMock.dummy(),
      initialSearchType: initialSearchType,
    );
  }

  group('SearchBloc', () {
    group('init', () {
      group('when loading popular content', () {
        final movies = [
          getFakeMovie(id: 1, title: 'Popular Movie 1'),
          getFakeMovie(id: 2, title: 'Popular Movie 2'),
        ];
        final getPopularMoviesMock = GetPopularMoviesMock.dummy(movies: movies);

        final searchBloc = getSearchBloc(
          getPopularMovies: getPopularMoviesMock,
        );

        blocTest<SearchBloc, SearchState>(
          'emits correct state when loading popular content',
          build: () => searchBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<SearchState>().having((state) => state.isLoading, 'isLoading', isTrue),
            isA<SearchState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.pages?.length, 'pages length', 1)
                .having((state) => state.pages?.first.length, 'first page items', 2)
                .having((state) => state.keys?.length, 'keys length', 1)
                .having((state) => state.keys?.first, 'first key', 1)
                .having((state) => state.hasNextPage, 'hasNextPage', isFalse),
          ],
        );
      });

      group('when performing filtered search', () {
        final searchItems = [
          getFakeSearchItem(id: 1, title: 'Filtered Movie 1'),
          getFakeSearchItem(id: 2, title: 'Filtered Movie 2'),
        ];
        final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy(
          searchItems: searchItems,
        );

        final searchBloc = getSearchBloc(
          searchMovieWithFilter: searchMovieWithFilterMock,
        );

        blocTest<SearchBloc, SearchState>(
          'emits correct state when performing filtered search',
          build: () => searchBloc,
          act: (bloc) => bloc.init(
            query: 'test query',
            filter: SearchFilter.genres,
            type: SearchType.movie,
          ),
          expect: () => [
            isA<SearchState>().having((state) => state.isLoading, 'isLoading', isTrue),
            isA<SearchState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.pages?.length, 'pages length', 1)
                .having((state) => state.pages?.first.length, 'first page items', 2)
                .having((state) => state.keys?.length, 'keys length', 1)
                .having((state) => state.keys?.first, 'first key', 1)
                .having((state) => state.hasNextPage, 'hasNextPage', isTrue)
                .having((state) => state.searchFilter, 'searchFilter', SearchFilter.genres),
          ],
        );
      });

      group('when getPopularMovies fails', () {
        final getPopularMoviesMock = GetPopularMoviesMock();
        final error = ServerError(statusCode: 500);

        when(() => getPopularMoviesMock.call()).thenAnswer(
          (_) async => Failure(error),
        );

        final searchBloc = getSearchBloc(
          getPopularMovies: getPopularMoviesMock,
        );

        blocTest<SearchBloc, SearchState>(
          'emits error state when getPopularMovies fails',
          build: () => searchBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<SearchState>().having((state) => state.isLoading, 'isLoading', isTrue),
            isA<SearchState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.hasError, 'hasError', isTrue)
                .having((state) => state.error, 'error', isA<ServerError>()),
          ],
        );
      });
    });

    group('loadNextPage', () {
      group('when loading next page with filter', () {
        const filter = SearchFilter.cast;
        final searchItems = [
          getFakeSearchItem(id: 5, title: 'Filtered Next Page Movie 1'),
          getFakeSearchItem(id: 6, title: 'Filtered Next Page Movie 2'),
        ];
        final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy(
          searchItems: searchItems,
          filter: filter,
        );

        final searchBloc = getSearchBloc(
          searchMovieWithFilter: searchMovieWithFilterMock,
        );

        blocTest<SearchBloc, SearchState>(
          'emits correct state when loading next page with filter',
          build: () => searchBloc,
          act: (bloc) async {
            await bloc.init(
              query: 'test query',
              filter: filter,
            );
            await Future.delayed(const Duration(seconds: 1));
            await bloc.loadNextPage();
          },
          expect: () => [
            isA<SearchState>().having((state) => state.isLoading, 'isLoading', isTrue),
            isA<SearchState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.searchFilter, 'searchFilter', filter),
            isA<SearchState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.pages?.length, 'pages length', 2),
          ],
        );
      });
    });

    group('changeSearchType', () {
      final searchBloc = getSearchBloc();

      blocTest<SearchBloc, SearchState>(
        'emits state with updated search type',
        build: () => searchBloc,
        act: (bloc) => bloc.changeSearchType(SearchType.series),
        expect: () => [
          isA<SearchState>().having((state) => state.selectedType, 'selectedType', SearchType.series),
        ],
      );
    });

    group('changeSearchFilter', () {
      final searchBloc = getSearchBloc();

      blocTest<SearchBloc, SearchState>(
        'emits state with updated search filter',
        build: () => searchBloc,
        act: (bloc) => bloc.changeSearchFilter(SearchFilter.genres),
        expect: () => [
          isA<SearchState>().having((state) => state.searchFilter, 'searchFilter', SearchFilter.genres),
        ],
      );
    });

    group('clearSearch', () {
      final movies = [
        getFakeMovie(id: 1, title: 'Popular Movie 1'),
        getFakeMovie(id: 2, title: 'Popular Movie 2'),
      ];
      final getPopularMoviesMock = GetPopularMoviesMock.dummy(movies: movies);

      final searchBloc = getSearchBloc(
        getPopularMovies: getPopularMoviesMock,
      );

      blocTest<SearchBloc, SearchState>(
        'emits state when clearing search',
        build: () => searchBloc,
        act: (bloc) => bloc.clearSearch(),
        expect: () => [
          isA<SearchState>()
              .having((state) => state.isLoading, 'isLoading', isFalse)
              .having((state) => state.pages?.length, 'pages length', 1)
              .having((state) => state.pages?.first.length, 'first page items', 2),
        ],
      );
    });

    group('onTryAgain', () {
      final movies = [getFakeSearchItem(id: 1), getFakeSearchItem(id: 2)];
      final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy(
        searchItems: movies,
      );
      final searchBloc = getSearchBloc(
        searchMovieWithFilter: searchMovieWithFilterMock,
      );

      blocTest<SearchBloc, SearchState>(
        'emits state when trying again',
        build: () => searchBloc,
        seed: () => const SearchState(isLoading: false, searchFilter: SearchFilter.genres),
        act: (bloc) => bloc.onTryAgain(),
        expect: () => [
          isA<SearchState>().having((state) => state.isLoading, 'isLoading', isTrue),
          isA<SearchState>()
              .having((state) => state.pages?.length, 'pages length', 1)
              .having((state) => state.pages?.first.length, 'first page items', 2)
        ],
      );
    });
  });
}
