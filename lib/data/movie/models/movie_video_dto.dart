import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';

part 'movie_video_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieVideoDto {
  final String? iso6391;
  final String? iso31661;
  final String name;
  final String key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String id;

  MovieVideoDto({
    this.iso6391,
    this.iso31661,
    required this.name,
    required this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    required this.id,
  });

  factory MovieVideoDto.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoDtoFromJson(json);

  MovieVideo toDomain() {
    return MovieVideo(
      iso6391: iso6391,
      iso31661: iso31661,
      name: name,
      key: key,
      site: site,
      size: size,
      type: type,
      official: official,
      publishedAt: publishedAt,
      id: id,
    );
  }
}
