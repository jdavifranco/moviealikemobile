import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/youtube/models/youtube_thumbnails_dto.dart';

part 'youtube_snippet_dto.g.dart';

@JsonSerializable()
class YoutubeSnippetDto {
  final String? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final YoutubeThumbnailsDto? thumbnails;
  final String? channelTitle;
  final String? liveBroadcastContent;
  final String? publishTime;

  YoutubeSnippetDto({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
  });

  factory YoutubeSnippetDto.fromJson(Map<String, dynamic> json) =>
      _$YoutubeSnippetDtoFromJson(json);
}
