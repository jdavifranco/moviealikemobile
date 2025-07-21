// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeVideoItemDto _$YoutubeVideoItemDtoFromJson(Map<String, dynamic> json) =>
    YoutubeVideoItemDto(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      id: json['id'] == null
          ? null
          : YoutubeVideoIdDto.fromJson(json['id'] as Map<String, dynamic>),
      snippet: json['snippet'] == null
          ? null
          : YoutubeSnippetDto.fromJson(json['snippet'] as Map<String, dynamic>),
    );
