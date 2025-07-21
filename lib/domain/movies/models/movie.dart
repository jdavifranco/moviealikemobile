import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/presentation/widgets/genres.dart';

class Movie {
  final bool? adult;

  final String? backdropPath;

  final List<int>? genreIds;

  final int id;

  final String? originalLanguage;

  final String? originalTitle;

  final String? overview;

  final double? popularity;

  final String? posterPath;

  final String? releaseDate;

  final String? title;

  final bool? video;

  final double? voteAverage;

  final int? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    required this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
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
      genreIds: genreIds,
      popularity: popularity,
      firstAirDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      originCountry: null,
      title: title,
      originalTitle: originalTitle);

  MovieRecommendation toMovieRecommendation(double similarity) =>
      MovieRecommendation(
          belongsToCollection: "",
          cast: "",
          castSize: 0,
          crewSize: 0,
          director: "",
          genres:
              genreIds?.map((e) => Genre.getById(e)?.name ?? "").toList() ?? [],
          id: id,
          keywords: "",
          originalLanguage: originalLanguage ?? "",
          overview: overview ?? "",
          popularity: popularity ?? 0,
          posterPath: posterPath ?? "",
          backdropPath: backdropPath ?? "",
          productionCompanies: "",
          productionCountries: "",
          releaseDate: releaseDate ?? "",
          runtime: 0,
          spokenLanguages: "",
          tagline: "",
          title: title ?? "",
          voteAverage: voteAverage ?? 0,
          voteCount: voteCount?.toDouble() ?? 0.0,
          similarity: similarity);
}
