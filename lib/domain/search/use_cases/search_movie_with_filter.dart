import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/repository/search_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class SearchMovieWithFilter {
  final SearchRepository _searchRepository;

  SearchMovieWithFilter(
    this._searchRepository,
  );

  Future<Result<List<SearchItem>, RequestError>> call(
          {required String query,
          SearchType type = SearchType.movie,
          required SearchFilter filter,
          int page = 1}) =>
      _searchRepository.getMoviesByFilter(
          query: query, searchType: type, filter: filter, page: page);
}
