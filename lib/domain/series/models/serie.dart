import 'package:moviealike/domain/search/models/search_item.dart';

class Serie {
  final bool? adult;

  final String? backdropPath;

  final List<int>? genreIds;

  final int id;

  final String? originalLanguage;

  final String? originalName;

  final String? overview;

  final double? popularity;

  final String? posterPath;

  final String? firstAirDate;

  final String? name;

  final double? voteAverage;

  final int? voteCount;

  Serie({
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

  SearchItem toSearchItem() => SearchItem(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      name: name,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      posterPath: posterPath,
      mediaType: "tv",
      genreIds: genreIds,
      popularity: popularity,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      originCountry: null,
      title: name,
      originalTitle: originalName);
}
