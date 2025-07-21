import 'package:injectable/injectable.dart';
import 'package:moviealike/data/series/datasource/series_data_source.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/series/models/serie.dart';
import 'package:moviealike/domain/series/repository/serie_repository.dart';
import 'package:result_type/result_type.dart';

@Injectable(as: SeriesRepository)
class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesDataSource seriesDataSource;

  SeriesRepositoryImpl(this.seriesDataSource);
  @override
  Future<Result<List<Serie>, RequestError>> getPopularSeries() async {
    final result = await seriesDataSource.getPopularSeries();
    return result.map((dtos) => dtos.map((e) => e.toDomain()).toList());
  }

  @override
  Future<Result<List<Serie>, RequestError>> getUpcomingSeries() async {
    final result = await seriesDataSource.getUpcomingSeries();
    return result.map((dtos) => dtos.map((e) => e.toDomain()).toList());
  }
}
