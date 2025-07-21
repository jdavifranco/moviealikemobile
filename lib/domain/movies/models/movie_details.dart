import 'package:moviealike/data/movie/models/genre_dto.dart';
import 'package:moviealike/data/movie/models/production_company_dto.dart';
import 'package:moviealike/data/movie/models/production_country_dto.dart';
import 'package:moviealike/data/movie/models/spoken_language_dto.dart';
import 'package:moviealike/domain/movies/models/movie_images.dart';
import 'package:moviealike/domain/movies/models/watch_providers.dart';
import 'package:moviealike/domain/search/models/search_item.dart';

class MovieDetails {
  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<GenreDto>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyDto>? productionCompanies;
  final List<ProductionCountryDto>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguageDto>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final MovieImages? movieImages;
  final WatchProviders? providers;
  MovieDetails({
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
    this.movieImages,
    this.providers,
  });

  SearchItem toSearchItem() => SearchItem(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      name: title,
      originalLanguage: originalLanguage,
      originalName: originalTitle,
      overview: overview,
      posterPath: posterPath,
      mediaType: "movie",
      genreIds: genres?.map((e) => e.id).toList(),
      popularity: popularity,
      firstAirDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      originCountry: [],
      title: title,
      originalTitle: originalTitle);
}
