import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/movie/models/movie_keyword_dto.dart';
part 'movie_keywords_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieKeywordsDto {
  final List<MovieKeywordDto> keywords;

  MovieKeywordsDto({required this.keywords});

  factory MovieKeywordsDto.fromJson(Map<String, dynamic> json) =>
      _$MovieKeywordsDtoFromJson(json);
}
