import 'package:injectable/injectable.dart';
import 'package:moviealike/data/movie/models/movie_results_dto.dart';
import 'package:moviealike/data/network_client/network_service.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/models/search_item_dto.dart';
import 'package:moviealike/data/search/models/search_result_dto.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/di/language_module.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:result_type/result_type.dart';

@injectable
class SearchDataSource {
  final NetworkService _networkService;
  final UserLanguage _userLanguage;

  SearchDataSource(this._networkService, this._userLanguage);

  Future<Result<List<SearchItemDto>, RequestError>> getSearchMoviesAndTvShows(
      String query, SearchType searchType, int page) async {
    final result = await _networkService.get(
      "/search/${searchType.apiType}",
      queryParameters: {
        'query': query,
        'include_adult': 'false',
        'language': _userLanguage.name,
        'page': page.toString(),
      },
    );

    return result.map((data) => SearchResultsDto.fromJson(data).results);
  }

  Future<Result<List<SearchItemDto>, RequestError>> getMoviesWithFilter(
      SearchFilter filter, String query, int page) async {
    final result = await _networkService.get(
      "/discover/movie",
      queryParameters: {
        'include_adult': 'false',
        'include_video': 'false',
        'language': _userLanguage.name,
        'page': page.toString(),
        'sort_by': 'popularity.desc',
        filter.name: query,
      },
    );

    return result.map((data) => MovieResultsDto.fromJson(data)
        .results
        .map((e) => e.toSearchItem())
        .toList());
  }
}
