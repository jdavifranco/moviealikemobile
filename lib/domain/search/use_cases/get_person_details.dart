import 'package:async/async.dart' hide Result;
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/search/models/person_details.dart';
import 'package:moviealike/domain/search/repository/search_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetPersonDetails {
  final SearchRepository _searchRepository;

  GetPersonDetails(this._searchRepository);

  CancelableOperation<Result<PersonDetails, RequestError>> call(int personId) =>
      _searchRepository.getPersonDetails(personId);
}
