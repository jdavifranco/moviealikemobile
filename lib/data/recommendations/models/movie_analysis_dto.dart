import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/recommendations/models/movie_analysis.dart';

part 'movie_analysis_dto.g.dart';

@JsonSerializable()
class MovieAnalysisDto {
  final String title;
  final Map<String, String> themes;
  final String emotionalImpact;
  final String socialRelevance;
  MovieAnalysisDto({
    required this.title,
    required this.themes,
    required this.emotionalImpact,
    required this.socialRelevance,
  });

  factory MovieAnalysisDto.fromJson(Map<String, dynamic> json) =>
      _$MovieAnalysisDtoFromJson(json);

  MovieAnalysis toDomain() => MovieAnalysis(
        title: title,
        themes: themes,
        emotionalImpact: emotionalImpact,
        socialRelevance: socialRelevance,
      );
}
