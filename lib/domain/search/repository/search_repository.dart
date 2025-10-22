import 'package:async/async.dart' hide Result;
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/models/person_details.dart';
import 'package:moviealike/domain/search/models/company_details.dart';
import 'package:result_type/result_type.dart';

abstract class SearchRepository {
  CancelableOperation<Result<List<SearchItem>, RequestError>> getMoviesAndSeries(
      String query, SearchType type, int page);
  CancelableOperation<Result<List<SearchItem>, RequestError>> getMoviesByFilter(
      {required SearchType searchType, required SearchFilter filter, required String query, int page = 1});
  CancelableOperation<Result<PersonDetails, RequestError>> getPersonDetails(int personId);
  CancelableOperation<Result<CompanyDetails, RequestError>> getCompanyDetails(int companyId);
}
