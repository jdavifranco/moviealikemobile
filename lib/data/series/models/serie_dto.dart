import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/series/models/serie.dart';

part 'serie_dto.g.dart';

@JsonSerializable(createToJson: false)
class SerieDto {
  @JsonKey(name: 'adult')
  final bool? adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_name')
  final String? originalName;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  SerieDto({
    this.adult,
    this.backdropPath,
    this.genreIds,
    required this.id,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory SerieDto.fromJson(Map<String, dynamic> json) =>
      _$SerieDtoFromJson(json);

  Serie toDomain() => Serie(
        adult: adult,
        backdropPath: backdropPath,
        id: id,
        genreIds: genreIds,
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        firstAirDate: firstAirDate?.split("-").first,
        name: name,
        voteAverage: voteAverage?.roundToDouble(),
        voteCount: voteCount,
      );
}
