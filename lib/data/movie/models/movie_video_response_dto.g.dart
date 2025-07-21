// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_video_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideoResponseDto _$MovieVideoResponseDtoFromJson(
        Map<String, dynamic> json) =>
    MovieVideoResponseDto(
      id: (json['id'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieVideoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
