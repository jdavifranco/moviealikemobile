// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/repository/search_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class SearchMovieByTitle {
  final SearchRepository _searchRepository;

  SearchMovieByTitle(
    this._searchRepository,
  );

  Future<Result<List<SearchItem>, RequestError>> call(
          String query, SearchType type,
          [int page = 1]) =>
      _searchRepository.getMoviesAndSeries(query, type, page);
}
