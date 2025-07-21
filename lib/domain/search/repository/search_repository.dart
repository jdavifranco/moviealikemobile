import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:result_type/result_type.dart';

abstract class SearchRepository {
  Future<Result<List<SearchItem>, RequestError>> getMoviesAndSeries(
      String query, SearchType type, int page);
  Future<Result<List<SearchItem>, RequestError>> getMoviesByFilter(
      {required SearchType searchType,
      required SearchFilter filter,
      required String query,
      int page = 1});
}
