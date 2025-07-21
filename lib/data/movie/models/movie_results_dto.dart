import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/movie/models/movie_dto.dart';
part 'movie_results_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieResultsDto {
  final List<MovieDto> results;

  MovieResultsDto({required this.results});

  factory MovieResultsDto.fromJson(Map<String, dynamic> json) =>
      _$MovieResultsDtoFromJson(json);
}
