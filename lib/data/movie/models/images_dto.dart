import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/movie/models/image_dto.dart';
import 'package:moviealike/domain/movies/models/movie_images.dart';

part 'images_dto.g.dart'; // This file will be generated

@JsonSerializable()
class ImagesDto {
  @JsonKey(name: 'backdrops')
  final List<ImageDto>? backdrops;
  @JsonKey(name: 'logos')
  final List<ImageDto>? logos;
  @JsonKey(name: 'posters')
  final List<ImageDto>? posters;
  ImagesDto({this.logos, this.backdrops, this.posters});

  factory ImagesDto.fromJson(Map<String, dynamic> json) =>
      _$ImagesDtoFromJson(json);

  MovieImages toDomain() => MovieImages(
        logos: logos?.map((e) => e.toDomain()).toList(),
        backdrops: backdrops?.map((e) => e.toDomain()).toList(),
        posters: posters?.map((e) => e.toDomain()).toList(),
      );
}
