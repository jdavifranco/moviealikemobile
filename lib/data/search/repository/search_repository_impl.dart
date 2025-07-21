import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/datasource/search_data_source.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/repository/search_repository.dart';
import 'package:result_type/result_type.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource searchDataSource;

  SearchRepositoryImpl(this.searchDataSource);

  @override
  Future<Result<List<SearchItem>, RequestError>> getMoviesAndSeries(
      String query, SearchType type, int page) async {
    final result =
        await searchDataSource.getSearchMoviesAndTvShows(query, type, page);
    if (result.isSuccess && result.success.isEmpty) {
      return Failure(NoResultsFound());
    }
    return result.map((movieDtos) =>
        movieDtos.map((movieDto) => movieDto.toDomain()).toList());
  }

  @override
  Future<Result<List<SearchItem>, RequestError>> getMoviesByFilter(
      {required SearchType searchType,
      required SearchFilter filter,
      required String query,
      int page = 1}) async {
    final result =
        await searchDataSource.getMoviesWithFilter(filter, query, page);

    return result.map((movieDtos) =>
        movieDtos.map((movieDto) => movieDto.toDomain()).toList());
  }
}
