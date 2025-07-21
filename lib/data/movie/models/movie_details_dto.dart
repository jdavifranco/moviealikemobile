import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/movie/models/genre_dto.dart';
import 'package:moviealike/data/movie/models/movie_keyword_dto.dart';
import 'package:moviealike/data/movie/models/production_company_dto.dart';
import 'package:moviealike/data/movie/models/production_country_dto.dart';
import 'package:moviealike/data/movie/models/spoken_language_dto.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';
import 'package:moviealike/domain/movies/models/movie_images.dart';
import 'package:moviealike/domain/movies/models/movie_keyword.dart';
import 'package:moviealike/domain/movies/models/watch_providers.dart';

part 'movie_details_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieDetailsDto {
  @JsonKey(name: 'adult')
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  final dynamic belongsToCollection;
  @JsonKey(name: 'budget')
  final int? budget;
  @JsonKey(name: 'genres')
  final List<GenreDto>? genres;
  @JsonKey(name: 'homepage')
  final String? homepage;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'popularity')
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'production_companies')
  final List<ProductionCompanyDto>? productionCompanies;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountryDto>? productionCountries;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'revenue')
  final int? revenue;
  @JsonKey(name: 'runtime')
  final int? runtime;
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguageDto>? spokenLanguages;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'tagline')
  final String? tagline;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'video')
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  MovieDetailsDto({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    required this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    required this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDtoFromJson(json);

  MovieDetails toDomain(MovieImages? movieImages, WatchProviders? providers) =>
      MovieDetails(
        adult: adult,
        backdropPath: backdropPath,
        budget: budget,
        genres: genres,
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        productionCompanies: productionCompanies,
        productionCountries: productionCountries,
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        spokenLanguages: spokenLanguages,
        status: status,
        tagline: tagline,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
        movieImages: movieImages,
        providers: providers,
      );
}
