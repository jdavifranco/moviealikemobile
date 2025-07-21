// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_thumbnails_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeThumbnailsDto _$YoutubeThumbnailsDtoFromJson(
        Map<String, dynamic> json) =>
    YoutubeThumbnailsDto(
      thumbnailDefault: json['default'] == null
          ? null
          : YoutubeThumbnailDto.fromJson(
              json['default'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : YoutubeThumbnailDto.fromJson(
              json['medium'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : YoutubeThumbnailDto.fromJson(json['high'] as Map<String, dynamic>),
    );
