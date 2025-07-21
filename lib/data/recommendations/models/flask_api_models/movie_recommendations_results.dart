import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/recommendations/models/flask_api_models/movie_recommendation_dto.dart';
part 'movie_recommendations_results.g.dart';

@JsonSerializable()
class MovieRecommendationsResults {
  List<MovieRecommendationDto> results;

  MovieRecommendationsResults({required this.results});

  factory MovieRecommendationsResults.fromJson(Map<String, dynamic> json) =>
      _$MovieRecommendationsResultsFromJson(json);
}
