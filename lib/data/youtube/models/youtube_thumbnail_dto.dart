import 'package:json_annotation/json_annotation.dart';

part 'youtube_thumbnail_dto.g.dart';

@JsonSerializable()
class YoutubeThumbnailDto {
  final String? url;
  final int? width;
  final int? height;

  YoutubeThumbnailDto({this.url, this.width, this.height});

  factory YoutubeThumbnailDto.fromJson(Map<String, dynamic> json) =>
      _$YoutubeThumbnailDtoFromJson(json);
}
