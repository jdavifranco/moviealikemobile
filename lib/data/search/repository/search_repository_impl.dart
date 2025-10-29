import 'package:async/async.dart' hide Result;
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/datasource/search_data_source.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/models/person_details.dart';
import 'package:moviealike/domain/search/models/company_details.dart';
import 'package:moviealike/domain/search/repository/search_repository.dart';
import 'package:result_type/result_type.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource searchDataSource;

  SearchRepositoryImpl(this.searchDataSource);

  @override
  CancelableOperation<Result<List<SearchItem>, RequestError>> getMoviesAndSeries(
      String query, SearchType type, int page) {
    final cancelableOperation = searchDataSource.getSearchMoviesAndTvShows(query, type, page);

    return cancelableOperation.then((result) {
      if (result.isSuccess && result.success.isEmpty) {
        return Failure(NoResultsFound());
      }
      return result.map((movieDtos) => movieDtos.map((movieDto) => movieDto.toDomain()).toList());
    });
  }

  @override
  CancelableOperation<Result<List<SearchItem>, RequestError>> getMoviesByFilter(
      {required SearchType searchType, required SearchFilter filter, required String query, int page = 1}) {
    final cancelableOperation = searchDataSource.getMoviesWithFilter(filter, query, page);

    return cancelableOperation
        .then((result) => result.map((movieDtos) => movieDtos.map((movieDto) => movieDto.toDomain()).toList()));
  }

  @override
  CancelableOperation<Result<PersonDetails, RequestError>> getPersonDetails(int personId) {
    final cancelableOperation = searchDataSource.getPersonDetails(personId);
    return cancelableOperation.then((result) => result.map((personDetailsDto) => personDetailsDto.toDomain()));
  }

  @override
  CancelableOperation<Result<CompanyDetails, RequestError>> getCompanyDetails(int companyId) {
    final cancelableOperation = searchDataSource.getCompanyDetails(companyId);
    return cancelableOperation.then((result) => result.map((companyDetailsDto) => companyDetailsDto.toDomain()));
  }
}
