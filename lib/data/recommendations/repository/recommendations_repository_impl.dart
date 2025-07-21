import 'package:injectable/injectable.dart';
import 'package:moviealike/data/recommendations/datasource/recommendations_data_source.dart';
import 'package:moviealike/data/recommendations/models/movie_input_dto.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';
import 'package:moviealike/domain/recommendations/models/movie_analysis.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:moviealike/domain/recommendations/repository/recommendations_repository.dart';

@Injectable(as: RecommendationsRepository)
class RecommendationsRepositoryImpl implements RecommendationsRepository {
  final RecommendationsDataSource recommendationsDataSource;

  RecommendationsRepositoryImpl(this.recommendationsDataSource);

  @override
  Future<Result<MovieAnalysis, RequestError>> getMovieAnalysis(
      MovieAnalysisInputDto movieInput) async {
    final result = await recommendationsDataSource.getMovieAnalysis(movieInput);
    return result.map((dto) => dto.toDomain());
  }

  @override
  Future<Result<List<MovieRecommendation>, RequestError>>
      getMovieRecommendationsCinefilo(int movieId) async {
    final result = await recommendationsDataSource
        .getMovieRecommendationsCinefilo(movieId);
    return result
        .map((dtos) => dtos.map((movieDto) => movieDto.toDomain()).toList());
  }
}
