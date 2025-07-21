class MovieRecommendation {
  final String? belongsToCollection;
  final String? cast;
  final int? castSize;
  final int? crewSize;
  final String? director;
  final List<String>? genres;
  final int id;
  final String? keywords;
  final String? originalLanguage;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? backdropPath;
  final String? productionCompanies;
  final String? productionCountries;
  final String? releaseDate;
  final double? runtime;
  final String? spokenLanguages;
  final String? tagline;
  final String? title;
  final double? voteAverage;
  final double? voteCount;
  final double similarity;

  const MovieRecommendation({
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
}
