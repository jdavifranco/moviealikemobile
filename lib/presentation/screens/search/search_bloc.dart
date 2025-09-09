import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/network_client/result_extensions.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/use_cases/search_movie_with_filter.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/movies/use_cases/get_popular_movies.dart';
import 'package:moviealike/domain/search/use_cases/search_movie_by_title.dart';

import 'package:moviealike/presentation/screens/search/search_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Cubit<SearchState> {
  final SearchMovieByTitle _searchMovieOrSeriesByTitle;
  final GetPopularMovies _getPopularMovies;
  final SearchMovieWithFilter _searchMovieWithFilter;

  final SearchType _initialSearchType;

  String _currentQuery = "";
  final _queryController = StreamController<String>();
  late final StreamSubscription<String> _querySubscription;

  static const Duration _debounceTime = Duration(milliseconds: 300);

  SearchBloc({
    required SearchMovieByTitle searchMovieOrSeriesByTitle,
    required GetPopularMovies getPopularMovies,
    required SearchMovieWithFilter searchMovieWithFilter,
    required SearchType initialSearchType,
  })  : _searchMovieOrSeriesByTitle = searchMovieOrSeriesByTitle,
        _getPopularMovies = getPopularMovies,
        _searchMovieWithFilter = searchMovieWithFilter,
        _initialSearchType = initialSearchType,
        super(const SearchState(isLoading: true)) {
    _initializeQuerySubscription();
  }

  Future<void> init({
    SearchType? type,
    SearchFilter? filter,
    String? query,
  }) async {
    _emitLoadingState();

    final searchType = type ?? _initialSearchType;

    if (query != null && query.isNotEmpty) {
      await _performFilteredSearch(query, filter!, searchType);
    } else {
      await _loadPopularContent(searchType);
    }
  }

  Future<void> loadNextPage({bool isNewSearch = false}) async {
    if (state.isLoading) return;

    if (isNewSearch) {
      _emitLoadingState();
    }

    if (state.searchFilter != null) {
      await _loadNextPageWithFilter(isNewSearch);
    } else {
      await _loadNextPageWithQuery(isNewSearch);
    }
  }

  void onQueryChanged(String query) {
    _queryController.add(query);
  }

  void onTryAgain() {
    loadNextPage(isNewSearch: true);
  }

  void changeSearchType(SearchType searchType) {
    emit(state.copyWith(selectedType: searchType));
    if (_currentQuery.isNotEmpty) {
      loadNextPage(isNewSearch: true);
    }
  }

  void clearSearch() {
    _currentQuery = "";
    _loadPopularContent(state.selectedType);
  }

  @override
  Future<void> close() {
    _querySubscription.cancel();
    _queryController.close();
    return super.close();
  }

  void _initializeQuerySubscription() {
    _querySubscription = _queryController.stream
        .debounceTime(_debounceTime)
        .listen(_onSearchQueryChanged);
  }

  void _emitLoadingState() {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      error: null,
    ));
  }

  void _emitErrorState(RequestError error) {
    emit(state.copyWith(
      hasError: true,
      isLoading: false,
      error: error,
    ));
  }

  void _emitSuccessState({
    required List<List<SearchItem>> pages,
    required List<int> keys,
    required bool hasNextPage,
    SearchFilter? searchFilter,
  }) {
    emit(state.copyWith(
      pages: pages,
      keys: keys,
      hasNextPage: hasNextPage,
      searchFilter: searchFilter,
      isLoading: false,
      hasError: false,
      error: null,
    ));
  }

  Future<void> _performFilteredSearch(
    String query,
    SearchFilter filter,
    SearchType searchType,
  ) async {
    _currentQuery = query;

    final result = await _searchMovieWithFilter(
      query: query,
      filter: filter,
      page: 1,
    );

    result.when(
      success: (movies) {
        _emitSuccessState(
          pages: [movies],
          keys: [1],
          hasNextPage: movies.isNotEmpty,
          searchFilter: filter,
        );
      },
      failure: (error) => _emitErrorState(error),
    );
  }

  Future<void> _loadPopularContent(SearchType searchType) async {
    final result = await _getPopularMovies();

    result.when(
      success: (movies) {
        final searchItems = movies.map((e) => e.toSearchItem()).toList();

        _emitSuccessState(
          pages: [searchItems],
          keys: [1],
          hasNextPage: false,
        );
      },
      failure: (error) => _emitErrorState(error),
    );
  }

  Future<void> _loadNextPageWithFilter(bool isNewSearch) async {
    final nextPage = _getNextPageNumber(isNewSearch);

    final result = await _searchMovieWithFilter(
      query: _currentQuery,
      filter: state.searchFilter!,
      page: nextPage,
    );

    result.when(
      success: (movies) {
        _emitSuccessState(
          pages: getNewPages(isNewSearch, movies),
          keys: getNewKeys(isNewSearch, nextPage),
          hasNextPage: movies.isNotEmpty,
        );
      },
      failure: (error) => _emitErrorState(error),
    );
  }

  Future<void> _loadNextPageWithQuery(bool isNewSearch) async {
    final nextPage = _getNextPageNumber(isNewSearch);

    final result = await _searchMovieOrSeriesByTitle(
      _currentQuery,
      state.selectedType,
      nextPage,
    );

    result.when(
      success: (movies) {
        _emitSuccessState(
          pages: getNewPages(isNewSearch, movies),
          keys: getNewKeys(isNewSearch, nextPage),
          hasNextPage: movies.isNotEmpty,
        );
      },
      failure: (error) {
        _emitErrorState(error);
      },
    );
  }

  List<List<SearchItem>> getNewPages(
      bool isNewSearch, List<SearchItem> movies) {
    if (isNewSearch) return [movies];
    return [...?state.pages, movies];
  }

  List<int> getNewKeys(bool isNewSearch, int nextPage) {
    if (isNewSearch) return [1];
    return [...?state.keys, nextPage];
  }

  int _getNextPageNumber(bool isNewSearch) {
    if (isNewSearch) return 1;
    if (state.keys == null || state.keys!.isEmpty) return 1;
    return state.keys!.last + 1;
  }

  Future<void> _onSearchQueryChanged(String query) async {
    if (query.isEmpty) {
      clearSearch();
      return;
    }

    loadNextPage(isNewSearch: query != _currentQuery);
    _currentQuery = query;
  }
}
