import 'package:async/async.dart' hide Result;
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/search/models/company_details.dart';
import 'package:moviealike/domain/search/repository/search_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetCompanyDetails {
  final SearchRepository _searchRepository;

  GetCompanyDetails(this._searchRepository);

  CancelableOperation<Result<CompanyDetails, RequestError>> call(
          int companyId) =>
      _searchRepository.getCompanyDetails(companyId);
}
