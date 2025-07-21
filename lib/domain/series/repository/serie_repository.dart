import 'package:moviealike/domain/series/models/serie.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

abstract class SeriesRepository {
  Future<Result<List<Serie>, RequestError>> getPopularSeries();
  Future<Result<List<Serie>, RequestError>> getUpcomingSeries();
}
