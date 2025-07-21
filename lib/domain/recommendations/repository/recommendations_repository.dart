import 'package:moviealike/data/recommendations/models/movie_input_dto.dart';
import 'package:moviealike/domain/recommendations/models/movie_analysis.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

abstract class RecommendationsRepository {
  Future<Result<MovieAnalysis, RequestError>> getMovieAnalysis(
      MovieAnalysisInputDto movieInputDto);

  Future<Result<List<MovieRecommendation>, RequestError>>
      getMovieRecommendationsCinefilo(int movieId);
}
