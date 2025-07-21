// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_results_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesResultsDto _$SeriesResultsDtoFromJson(Map<String, dynamic> json) =>
    SeriesResultsDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => SerieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
