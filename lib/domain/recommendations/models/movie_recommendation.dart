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
    this.belongsToCollection,
    this.cast,
    this.castSize,
    this.crewSize,
    this.director,
    this.genres,
    required this.id,
    this.keywords,
    this.originalLanguage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.runtime,
    this.spokenLanguages,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
    required this.similarity,
    this.backdropPath,
  });
}
