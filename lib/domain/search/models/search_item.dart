class SearchItem {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? name;
  final String? title;
  final String? originalLanguage;
  final String? originalTitle;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final List<String>? originCountry;

  SearchItem({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
    this.title,
    this.originalTitle,
  });

  @override
  String toString() {
    return 'SearchItem(adult: $adult, backdropPath: $backdropPath, id: $id, name: $name, title: $title, originalLanguage: $originalLanguage, originalTitle: $originalTitle, originalName: $originalName, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, genreIds: $genreIds, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage, voteCount: $voteCount, originCountry: $originCountry)';
  }
}
