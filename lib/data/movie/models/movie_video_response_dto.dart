import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/movie/models/movie_video_dto.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';

part 'movie_video_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieVideoResponseDto {
  final int id;
  final List<MovieVideoDto> results;

  MovieVideoResponseDto({
    required this.id,
    required this.results,
  });

  factory MovieVideoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoResponseDtoFromJson(json);

  List<MovieVideo> toDomain() {
    return results.map((e) => e.toDomain()).toList();
  }
}
