// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_snippet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeSnippetDto _$YoutubeSnippetDtoFromJson(Map<String, dynamic> json) =>
    YoutubeSnippetDto(
      publishedAt: json['publishedAt'] as String?,
      channelId: json['channelId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnails: json['thumbnails'] == null
          ? null
          : YoutubeThumbnailsDto.fromJson(
              json['thumbnails'] as Map<String, dynamic>),
      channelTitle: json['channelTitle'] as String?,
      liveBroadcastContent: json['liveBroadcastContent'] as String?,
      publishTime: json['publishTime'] as String?,
    );
