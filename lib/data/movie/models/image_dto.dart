import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/movies/models/movie_image.dart';

part 'image_dto.g.dart'; // This file will be generated

@JsonSerializable()
class ImageDto {
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;

  final int? height;

  @JsonKey(name: 'iso_639_1')
  final String? iso6391;

  @JsonKey(name: 'file_path')
  final String? filePath;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  final int? width;

  ImageDto({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  MovieImage toDomain() => MovieImage(
        aspectRatio: aspectRatio,
        voteAverage: voteAverage,
        voteCount: voteCount,
        filePath: filePath,
        height: height,
        width: width,
        iso6391: iso6391,
      );
}
