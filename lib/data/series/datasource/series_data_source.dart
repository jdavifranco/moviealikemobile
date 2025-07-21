import 'package:injectable/injectable.dart';
import 'package:moviealike/data/movie/models/movie_details_dto.dart';
import 'package:moviealike/data/series/models/serie_dto.dart';
import 'package:moviealike/data/series/models/series_results_dto.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';
import 'package:moviealike/data/network_client/network_service.dart';

@injectable
class SeriesDataSource {
  final NetworkService _networkService;
  SeriesDataSource(this._networkService);
  //TODO: add language

  Future<Result<List<SerieDto>, RequestError>> getUpcomingSeries() async {
    final result = await _networkService.get(
      "/tv/on_the_air",
      queryParameters: {"language": "en-US", "page": 1},
    );
    return result.map((data) => SeriesResultsDto.fromJson(data).results);
  }

  Future<Result<List<SerieDto>, RequestError>> getPopularSeries() async {
    final result = await _networkService.get(
      "/tv/popular",
      queryParameters: {"language": "en-US", "page": 1},
    );
    return result.map((data) => SeriesResultsDto.fromJson(data).results);
  }

  Future<Result<MovieDetailsDto, RequestError>> getSeriesDetails(
      int movieId) async {
    final response = await _networkService.get(
      "/movie/$movieId",
    );

    return response.map((data) => MovieDetailsDto.fromJson(data));
  }
}
