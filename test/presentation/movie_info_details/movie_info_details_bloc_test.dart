import 'package:async/async.dart' hide Result;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/company_details.dart';
import 'package:moviealike/domain/search/models/person_details.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/use_cases/get_company_details.dart';
import 'package:moviealike/domain/search/use_cases/get_person_details.dart';
import 'package:moviealike/domain/search/use_cases/search_movie_with_filter.dart';
import 'package:moviealike/presentation/screens/movie_info_details/movie_info_details_bloc.dart';
import 'package:moviealike/presentation/screens/movie_info_details/movie_info_details_state.dart';
import 'package:result_type/result_type.dart';

import '../../mocks/models/fake_company_details.dart';
import '../../mocks/models/fake_person_details.dart';
import '../../mocks/models/fake_search_item.dart';

class GetPersonDetailsMock extends Mock implements GetPersonDetails {
  static GetPersonDetailsMock dummy({PersonDetails? personDetails}) {
    final mock = GetPersonDetailsMock();
    when(() => mock.call(any())).thenAnswer(
      (_) => CancelableOperation.fromFuture(
        Future.value(Success(personDetails ?? getFakePersonDetails())),
      ),
    );
    return mock;
  }
}

class GetCompanyDetailsMock extends Mock implements GetCompanyDetails {
  static GetCompanyDetailsMock dummy({CompanyDetails? companyDetails}) {
    final mock = GetCompanyDetailsMock();
    when(() => mock.call(any())).thenAnswer(
      (_) => CancelableOperation.fromFuture(
        Future.value(Success(companyDetails ?? getFakeCompanyDetails())),
      ),
    );
    return mock;
  }
}

class SearchMovieWithFilterMock extends Mock implements SearchMovieWithFilter {
  static SearchMovieWithFilterMock dummy({List<SearchItem>? searchItems}) {
    final mock = SearchMovieWithFilterMock();
    when(() => mock.call(
          query: any(named: 'query'),
          filter: any(named: 'filter'),
          type: any(named: 'type'),
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
  registerFallbackValue(getFakePersonDetails());
  registerFallbackValue(getFakeCompanyDetails());
  registerFallbackValue(getFakeSearchItem());
  registerFallbackValue(SearchFilter.people);
  registerFallbackValue(SearchFilter.companies);
  registerFallbackValue(SearchFilter.cast);
  registerFallbackValue(SearchFilter.crew);
  registerFallbackValue(SearchType.movie);

  MovieInfoDetailsBloc getMovieInfoDetailsBloc({
    GetPersonDetails? getPersonDetails,
    GetCompanyDetails? getCompanyDetails,
    SearchMovieWithFilter? searchMovieWithFilter,
    SearchFilter filterType = SearchFilter.people,
    int filterId = 123,
  }) {
    return MovieInfoDetailsBloc(
      getPersonDetails ?? GetPersonDetailsMock.dummy(),
      getCompanyDetails ?? GetCompanyDetailsMock.dummy(),
      searchMovieWithFilter ?? SearchMovieWithFilterMock.dummy(),
      filterType,
      filterId,
    );
  }

  group('MovieInfoDetailsBloc', () {
    group('init', () {
      group('when filterType is person filter', () {
        final personDetails = getFakePersonDetails(
          id: 123,
          name: 'Test Person',
          biography: 'Test Biography',
        );
        final searchItems = [
          getFakeSearchItem(id: 1, title: 'Movie 1'),
          getFakeSearchItem(id: 2, title: 'Movie 2'),
        ];

        final getPersonDetailsMock = GetPersonDetailsMock.dummy(
          personDetails: personDetails,
        );
        final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy(
          searchItems: searchItems,
        );

        final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
          getPersonDetails: getPersonDetailsMock,
          searchMovieWithFilter: searchMovieWithFilterMock,
          filterType: SearchFilter.people,
          filterId: 123,
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'emits correct state when person details and movies are loaded successfully',
          build: () => movieInfoDetailsBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isTrue),
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having(
                    (state) => state.personDetails, 'personDetails', isNotNull)
                .having((state) => state.personDetails?.name, 'person name',
                    'Test Person'),
            isA<MovieInfoDetailsState>()
                .having((state) => state.pages.length, 'pages length', 1)
                .having(
                    (state) => state.pages.first.length, 'first page items', 2)
                .having((state) => state.keys.length, 'keys length', 1)
                .having((state) => state.keys.first, 'first key', 1)
                .having((state) => state.hasNextPage, 'hasNextPage', isTrue)
          ],
        );
      });

      group('when filterType is company filter', () {
        final companyDetails = getFakeCompanyDetails(
          id: 456,
          name: 'Test Company',
          description: 'Test Description',
        );
        final searchItems = [
          getFakeSearchItem(id: 3, title: 'Company Movie 1'),
          getFakeSearchItem(id: 4, title: 'Company Movie 2'),
        ];

        final getCompanyDetailsMock = GetCompanyDetailsMock.dummy(
          companyDetails: companyDetails,
        );
        final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy(
          searchItems: searchItems,
        );

        final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
          getCompanyDetails: getCompanyDetailsMock,
          searchMovieWithFilter: searchMovieWithFilterMock,
          filterType: SearchFilter.companies,
          filterId: 456,
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'emits correct state when company details and movies are loaded successfully',
          build: () => movieInfoDetailsBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isTrue),
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.companyDetails, 'companyDetails',
                    isNotNull)
                .having((state) => state.companyDetails?.name, 'company name',
                    'Test Company'),
            isA<MovieInfoDetailsState>()
                .having((state) => state.pages.length, 'pages length', 1)
                .having(
                    (state) => state.pages.first.length, 'first page items', 2)
                .having((state) => state.keys.length, 'keys length', 1)
                .having((state) => state.keys.first, 'first key', 1)
                .having((state) => state.hasNextPage, 'hasNextPage', isTrue)
          ],
        );
      });

      group('when getPersonDetails fails', () {
        final getPersonDetailsMock = GetPersonDetailsMock();
        final error = ServerError(statusCode: 500);

        when(() => getPersonDetailsMock.call(any())).thenAnswer(
          (_) => CancelableOperation.fromFuture(
            Future.value(Failure(error)),
          ),
        );

        final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
          getPersonDetails: getPersonDetailsMock,
          filterType: SearchFilter.people,
          filterId: 123,
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'emits error state when getPersonDetails fails',
          build: () => movieInfoDetailsBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isTrue),
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.hasError, 'hasError', isTrue)
                .having((state) => state.error, 'error', isA<ServerError>()),
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
          ],
        );
      });

      group('when getCompanyDetails fails', () {
        final getCompanyDetailsMock = GetCompanyDetailsMock();
        final error = ServerError(statusCode: 500);

        when(() => getCompanyDetailsMock.call(any())).thenAnswer(
          (_) => CancelableOperation.fromFuture(
            Future.value(Failure(error)),
          ),
        );

        final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
          getCompanyDetails: getCompanyDetailsMock,
          filterType: SearchFilter.companies,
          filterId: 456,
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'emits error state when getCompanyDetails fails',
          build: () => movieInfoDetailsBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isTrue),
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.hasError, 'hasError', isTrue)
                .having((state) => state.error, 'error', isA<ServerError>()),
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
          ],
        );
      });

      group('when searchMovieWithFilter fails', () {
        final searchMovieWithFilterMock = SearchMovieWithFilterMock();
        final error = ServerError(statusCode: 500);

        when(() => searchMovieWithFilterMock.call(
              query: any(named: 'query'),
              filter: any(named: 'filter'),
              type: any(named: 'type'),
              page: any(named: 'page'),
            )).thenAnswer(
          (_) => CancelableOperation.fromFuture(
            Future.value(Failure(error)),
          ),
        );

        final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
          searchMovieWithFilter: searchMovieWithFilterMock,
          filterType: SearchFilter.people,
          filterId: 123,
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'emits error state when searchMovieWithFilter fails',
          build: () => movieInfoDetailsBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isTrue),
            isA<MovieInfoDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having(
                    (state) => state.personDetails, 'personDetails', isNotNull),
            isA<MovieInfoDetailsState>()
                .having((state) => state.hasError, 'hasError', isTrue)
                .having((state) => state.error, 'error', isA<ServerError>()),
          ],
        );
      });
    });

    group('loadNextPage', () {
      group('when hasNextPage is true', () {
        final searchItems = [
          getFakeSearchItem(id: 5, title: 'Next Page Movie 1'),
          getFakeSearchItem(id: 6, title: 'Next Page Movie 2'),
        ];
        final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy(
          searchItems: searchItems,
        );

        final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
          searchMovieWithFilter: searchMovieWithFilterMock,
          filterType: SearchFilter.people,
          filterId: 123,
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'emits correct state when loading next page',
          build: () => movieInfoDetailsBloc,
          seed: () => MovieInfoDetailsState(
            filterType: SearchFilter.people,
            filterId: 123,
            pages: [
              [getFakeSearchItem(id: 1, title: 'Movie 1')],
            ],
            keys: [1],
            hasNextPage: true,
          ),
          act: (bloc) => bloc.loadNextPage(),
          expect: () => [
            isA<MovieInfoDetailsState>()
                .having((state) => state.pages.length, 'pages length', 2)
                .having((state) => state.keys.length, 'keys length', 2)
                .having((state) => state.hasNextPage, 'hasNextPage', isTrue),
          ],
        );
      });

      group('when hasNextPage is false', () {
        final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy();
        final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
          searchMovieWithFilter: searchMovieWithFilterMock,
          filterType: SearchFilter.people,
          filterId: 123,
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'does not load next page when hasNextPage is false',
          build: () => movieInfoDetailsBloc,
          seed: () => const MovieInfoDetailsState(
            hasNextPage: false,
            filterType: SearchFilter.people,
            filterId: 123,
          ),
          act: (bloc) => bloc.loadNextPage(),
          verify: (bloc) {
            verifyNever(() => searchMovieWithFilterMock.call(
                  query: any(named: 'query'),
                  filter: any(named: 'filter'),
                  type: any(named: 'type'),
                  page: any(named: 'page'),
                ));
          },
          expect: () => [],
        );
      });
    });

    group('retry', () {
      final personDetails = getFakePersonDetails(name: 'Retry Person');
      final searchItems = [
        getFakeSearchItem(id: 7, title: 'Retry Movie 1'),
      ];

      final getPersonDetailsMock = GetPersonDetailsMock.dummy(
        personDetails: personDetails,
      );
      final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy(
        searchItems: searchItems,
      );

      final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
        getPersonDetails: getPersonDetailsMock,
        searchMovieWithFilter: searchMovieWithFilterMock,
        filterType: SearchFilter.people,
        filterId: 123,
      );

      blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
        'emits correct state when retrying',
        build: () => movieInfoDetailsBloc,
        act: (bloc) => bloc.retry(),
        expect: () => [
          isA<MovieInfoDetailsState>()
              .having((state) => state.isLoading, 'isLoading', isTrue),
          isA<MovieInfoDetailsState>()
              .having((state) => state.isLoading, 'isLoading', isFalse)
              .having((state) => state.hasError, 'hasError', isFalse)
              .having((state) => state.error, 'error', isNull)
              .having(
                  (state) => state.personDetails, 'personDetails', isNotNull)
              .having((state) => state.personDetails?.name, 'person name',
                  'Retry Person'),
          isA<MovieInfoDetailsState>()
              .having((state) => state.pages.length, 'pages length', 1)
              .having(
                  (state) => state.pages.first.length, 'first page items', 1)
              .having((state) => state.hasNextPage, 'hasNextPage', isTrue)
              .having((state) => state.hasError, 'hasError', isFalse)
              .having((state) => state.error, 'error', isNull),
        ],
      );
    });

    group('retryMovies', () {
      final searchItems = [
        getFakeSearchItem(id: 8, title: 'Retry Movies 1'),
        getFakeSearchItem(id: 9, title: 'Retry Movies 2'),
      ];

      final searchMovieWithFilterMock = SearchMovieWithFilterMock.dummy(
        searchItems: searchItems,
      );

      final movieInfoDetailsBloc = getMovieInfoDetailsBloc(
        searchMovieWithFilter: searchMovieWithFilterMock,
        filterType: SearchFilter.people,
        filterId: 123,
      );

      blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
        'emits correct state when retrying movies',
        build: () => movieInfoDetailsBloc,
        act: (bloc) => bloc.retryMovies(),
        expect: () => [
          isA<MovieInfoDetailsState>()
              .having((state) => state.pages.length, 'pages length', 1)
              .having(
                  (state) => state.pages.first.length, 'first page items', 2)
              .having((state) => state.keys.length, 'keys length', 1)
              .having((state) => state.keys.first, 'first key', 1)
              .having((state) => state.hasNextPage, 'hasNextPage', isTrue)
              .having((state) => state.hasError, 'hasError', isFalse)
              .having((state) => state.error, 'error', isNull),
        ],
      );
    });

    group('state properties', () {
      group('isPersonFilter', () {
        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'returns true for people filter',
          build: () => getMovieInfoDetailsBloc(filterType: SearchFilter.people),
          verify: (bloc) {
            expect(bloc.state.isPersonFilter, isTrue);
            expect(bloc.state.isCompanyFilter, isFalse);
          },
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'returns true for cast filter',
          build: () => getMovieInfoDetailsBloc(filterType: SearchFilter.cast),
          verify: (bloc) {
            expect(bloc.state.isPersonFilter, isTrue);
            expect(bloc.state.isCompanyFilter, isFalse);
          },
        );

        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'returns true for crew filter',
          build: () => getMovieInfoDetailsBloc(filterType: SearchFilter.crew),
          verify: (bloc) {
            expect(bloc.state.isPersonFilter, isTrue);
            expect(bloc.state.isCompanyFilter, isFalse);
          },
        );
      });

      group('isCompanyFilter', () {
        blocTest<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          'returns true for companies filter',
          build: () =>
              getMovieInfoDetailsBloc(filterType: SearchFilter.companies),
          verify: (bloc) {
            expect(bloc.state.isPersonFilter, isFalse);
            expect(bloc.state.isCompanyFilter, isTrue);
          },
        );
      });
    });
  });
}
