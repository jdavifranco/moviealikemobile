// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_results_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResultsDto _$MovieResultsDtoFromJson(Map<String, dynamic> json) =>
    MovieResultsDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
