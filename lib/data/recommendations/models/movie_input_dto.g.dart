// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_input_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieAnalysisInputDto _$MovieAnalysisInputDtoFromJson(
        Map<String, dynamic> json) =>
    MovieAnalysisInputDto(
      title: json['title'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      yearOfRelease: (json['yearOfRelease'] as num?)?.toInt(),
      rating: (json['rating'] as num).toDouble(),
      overview: json['overview'] as String,
      numberOfRecommendations:
          (json['numberOfRecommendations'] as num?)?.toInt() ?? 4,
    );
