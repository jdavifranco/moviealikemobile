// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_recommendations_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRecommendationsResults _$MovieRecommendationsResultsFromJson(
        Map<String, dynamic> json) =>
    MovieRecommendationsResults(
      results: (json['results'] as List<dynamic>)
          .map(
              (e) => MovieRecommendationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
