// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/domain/series/models/serie.dart';
import 'package:moviealike/domain/series/repository/serie_repository.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetUpcomingSeries {
  final SeriesRepository _seriesRepository;

  GetUpcomingSeries(
    this._seriesRepository,
  );

  Future<Result<List<Serie>, RequestError>> call() =>
      _seriesRepository.getUpcomingSeries();
}
