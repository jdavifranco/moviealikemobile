// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_video_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideoDto _$MovieVideoDtoFromJson(Map<String, dynamic> json) =>
    MovieVideoDto(
      iso6391: json['iso6391'] as String?,
      iso31661: json['iso31661'] as String?,
      name: json['name'] as String,
      key: json['key'] as String,
      site: json['site'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      official: json['official'] as bool?,
      publishedAt: json['publishedAt'] as String?,
      id: json['id'] as String,
    );
