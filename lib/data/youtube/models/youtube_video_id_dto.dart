import 'package:json_annotation/json_annotation.dart';

part 'youtube_video_id_dto.g.dart';

@JsonSerializable()
class YoutubeVideoIdDto {
  final String? kind;
  final String? videoId;

  YoutubeVideoIdDto({this.kind, this.videoId});

  factory YoutubeVideoIdDto.fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoIdDtoFromJson(json);
}
