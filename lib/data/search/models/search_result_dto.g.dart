// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultsDto _$SearchResultsDtoFromJson(Map<String, dynamic> json) =>
    SearchResultsDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => SearchItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
