import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/movies/models/movie_keyword.dart';
part 'movie_keyword_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieKeywordDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  MovieKeywordDto({required this.id, required this.name});

  factory MovieKeywordDto.fromJson(Map<String, dynamic> json) =>
      _$MovieKeywordDtoFromJson(json);

  MovieKeyword toDomain() => MovieKeyword(id: id, name: name);
}
