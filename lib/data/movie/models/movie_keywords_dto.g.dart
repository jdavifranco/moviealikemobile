// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_keywords_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieKeywordsDto _$MovieKeywordsDtoFromJson(Map<String, dynamic> json) =>
    MovieKeywordsDto(
      keywords: (json['keywords'] as List<dynamic>)
          .map((e) => MovieKeywordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
