import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/data/network_client/result_extensions.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/use_cases/get_person_details.dart';
import 'package:moviealike/domain/search/use_cases/get_company_details.dart';
import 'package:moviealike/domain/search/use_cases/search_movie_with_filter.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/presentation/screens/filter_details/filter_details_state.dart';

class FilterDetailsBloc extends Cubit<FilterDetailsState> {
  final GetPersonDetails _getPersonDetails;
  final GetCompanyDetails _getCompanyDetails;
  final SearchMovieWithFilter _searchMovieWithFilter;
  final SearchFilter filterType;
  final int filterId;

  FilterDetailsBloc(
    this._getPersonDetails,
    this._getCompanyDetails,
    this._searchMovieWithFilter,
    this.filterType,
    this.filterId,
  ) : super(FilterDetailsState(
          filterType: filterType,
          filterId: filterId,
        ));

  void init() async {
    emit(state.copyWith(isLoading: true, hasError: false, error: null));

    await _loadFilterDetails();

    await _loadMovies(isNewSearch: true);
  }

  Future<void> _loadFilterDetails() async {
    if (state.isPersonFilter) {
      final result = await _getPersonDetails(filterId).valueOrCancellation();
      if (result != null) {
        result.when(
          success: (personDetails) {
            emit(state.copyWith(
              personDetails: personDetails,
              isLoading: false,
              hasError: false,
              error: null,
            ));
          },
          failure: (error) {
            emit(state.copyWith(
              isLoading: false,
              hasError: true,
              error: error,
            ));
          },
        );
      }
    } else if (state.isCompanyFilter) {
      final result = await _getCompanyDetails(filterId).valueOrCancellation();
      if (result != null) {
        result.when(
          success: (companyDetails) {
            emit(state.copyWith(
              companyDetails: companyDetails,
              isLoading: false,
              hasError: false,
              error: null,
            ));
          },
          failure: (error) {
            emit(state.copyWith(
              isLoading: false,
              hasError: true,
              error: error,
            ));
          },
        );
      }
    }
  }

  Future<void> _loadMovies({bool isNewSearch = false}) async {
    final nextPage = _getNextPageNumber(isNewSearch);

    final result = await _searchMovieWithFilter(
      query: filterId.toString(),
      filter: filterType,
      type: SearchType.movie,
      page: nextPage,
    ).valueOrCancellation();

    if (result != null) {
      result.when(
        success: (newMovies) {
          emit(state.copyWith(
            pages: _getNewPages(isNewSearch, newMovies),
            keys: _getNewKeys(isNewSearch, nextPage),
            hasNextPage: newMovies.isNotEmpty,
            hasError: false,
            error: null,
          ));
        },
        failure: (error) {
          emit(state.copyWith(
            hasError: true,
            error: error,
          ));
        },
      );
    }
  }

  Future<void> loadNextPage({bool isNewSearch = false}) async {
    if (state.hasNextPage) {
      _loadMovies(isNewSearch: false);
    }
  }

  void retry() {
    init();
  }

  void retryMovies() {
    _loadMovies(isNewSearch: true);
  }

  List<List<SearchItem>> _getNewPages(
      bool isNewSearch, List<SearchItem> movies) {
    if (isNewSearch) return [movies];
    return [...state.pages, movies];
  }

  List<int> _getNewKeys(bool isNewSearch, int nextPage) {
    if (isNewSearch) return [1];
    return [...state.keys, nextPage];
  }

  int _getNextPageNumber(bool isNewSearch) {
    if (isNewSearch) return 1;
    if (state.keys.isEmpty) return 1;
    return state.keys.last + 1;
  }
}
