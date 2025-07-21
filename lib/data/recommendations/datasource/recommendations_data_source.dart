import 'dart:core';

import 'package:injectable/injectable.dart';
import 'package:moviealike/data/recommendations/models/flask_api_models/movie_recommendation_dto.dart';
import 'package:moviealike/data/recommendations/models/movie_analysis_dto.dart';
import 'package:moviealike/data/recommendations/models/movie_input_dto.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';
import 'package:moviealike/data/network_client/network_service.dart';
import 'package:moviealike/data/network_client/api_config.dart';

@injectable
class RecommendationsDataSource {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static final bearer = "Bearer ${ApiConfig.tmdbBearerToken}";
  final NetworkService _networkService;

  RecommendationsDataSource(this._networkService);

  Future<Result<MovieAnalysisDto, RequestError>> getMovieAnalysis(
      MovieAnalysisInputDto movieInput) async {
    final result = await _networkService.get(
      "/movie/analysis/${movieInput.title}",
      queryParameters: {},
    );
    return result.map((data) => MovieAnalysisDto.fromJson(data));
  }

  Future<Result<List<MovieRecommendationDto>, RequestError>>
      getMovieRecommendationsCinefilo(int movieId) async {
    final result = await _networkService.get(
      "/movie/recommendations/$movieId",
      queryParameters: {},
    );
    return result.map((data) => (data["results"] as List<dynamic>)
        .map((e) => MovieRecommendationDto.fromJson(e as Map<String, dynamic>))
        .toList());
  }
}
