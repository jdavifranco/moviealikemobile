// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonDto _$SeasonDtoFromJson(Map<String, dynamic> json) => SeasonDto(
      airDate: json['air_date'] as String?,
      episodeCount: (json['episode_count'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      seasonNumber: (json['season_number'] as num).toInt(),
      voteAverage: (json['vote_average'] as num).toDouble(),
    );
