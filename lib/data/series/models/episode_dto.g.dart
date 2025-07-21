// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeDto _$EpisodeDtoFromJson(Map<String, dynamic> json) => EpisodeDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      airDate: json['air_date'] as String,
      episodeNumber: (json['episode_number'] as num).toInt(),
      episodeType: json['episode_type'] as String,
      productionCode: json['production_code'] as String,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num).toInt(),
      showId: (json['show_id'] as num).toInt(),
      stillPath: json['still_path'] as String?,
    );
