import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/youtube/models/youtube_thumbnail_dto.dart';

part 'youtube_thumbnails_dto.g.dart';

@JsonSerializable()
class YoutubeThumbnailsDto {
  @JsonKey(name: 'default')
  final YoutubeThumbnailDto? thumbnailDefault;
  final YoutubeThumbnailDto? medium;
  final YoutubeThumbnailDto? high;

  YoutubeThumbnailsDto({
    this.thumbnailDefault,
    this.medium,
    this.high,
  });

  factory YoutubeThumbnailsDto.fromJson(Map<String, dynamic> json) =>
      _$YoutubeThumbnailsDtoFromJson(json);
}
