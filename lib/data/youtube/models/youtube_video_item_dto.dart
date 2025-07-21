import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/youtube/models/youtube_video_id_dto.dart';
import 'package:moviealike/data/youtube/models/youtube_snippet_dto.dart';

part 'youtube_video_item_dto.g.dart';

@JsonSerializable()
class YoutubeVideoItemDto {
  final String? kind;
  final String? etag;
  final YoutubeVideoIdDto? id;
  final YoutubeSnippetDto? snippet;

  YoutubeVideoItemDto({this.kind, this.etag, this.id, this.snippet});

  factory YoutubeVideoItemDto.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoItemDtoFromJson(json);
}
