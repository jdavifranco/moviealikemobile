// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:moviealike/domain/recommendations/repository/recommendations_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetMovieRecommendations {
  final RecommendationsRepository _recommendationsRepository;

  GetMovieRecommendations(
    this._recommendationsRepository,
  );

  Future<Result<List<MovieRecommendation>, RequestError>> call(
          SearchType searchType, int movieId) =>
      _recommendationsRepository.getMovieRecommendationsCinefilo(movieId);
}
