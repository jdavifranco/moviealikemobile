import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/common/json_extensions.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';

part 'movie_recommendation_dto.g.dart';

@JsonSerializable()
@JsonStringToInt()
@JsonStringToDouble()
class MovieRecommendationDto {
  @JsonKey(name: 'belongs_to_collection')
  final String? belongsToCollection;

  @JsonKey(name: 'cast')
  final String? cast;

  @JsonKey(name: 'cast_size')
  final int? castSize;

  @JsonKey(name: 'crew_size')
  final int? crewSize;

  @JsonKey(name: 'director')
  final String? director;

  @JsonKey(name: 'genres')
  final String? genres;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'keywords')
  final String? keywords;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'production_companies')
  final String? productionCompanies;

  @JsonKey(name: 'production_countries')
  final String? productionCountries;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'runtime')
  final double? runtime;

  @JsonKey(name: 'spoken_languages')
  final String? spokenLanguages;

  @JsonKey(name: 'tagline')
  final String? tagline;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final double? voteCount;

  @JsonKey(name: 'similarity')
  final double similarity;

  MovieRecommendationDto({
    required this.belongsToCollection,
    required this.cast,
    required this.castSize,
    required this.crewSize,
    required this.director,
    required this.genres,
    required this.id,
    required this.keywords,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.runtime,
    required this.spokenLanguages,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.similarity,
    this.backdropPath,
  });

  factory MovieRecommendationDto.fromJson(Map<String, dynamic> json) =>
      _$MovieRecommendationDtoFromJson(json);

  MovieRecommendation toDomain() => MovieRecommendation(
        belongsToCollection: belongsToCollection,
        cast: cast,
        castSize: castSize,
        crewSize: crewSize,
        director: director,
        genres: genres?.split("|"),
        id: id,
        keywords: keywords,
        originalLanguage: originalLanguage,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        productionCompanies: productionCompanies,
        productionCountries: productionCountries,
        releaseDate: releaseDate,
        runtime: runtime,
        spokenLanguages: spokenLanguages,
        tagline: tagline,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
        similarity: similarity,
        backdropPath: backdropPath,
      );
}
