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
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
    required this.title,
    required this.originalTitle,
  });

  @override
  String toString() {
    return 'SearchItem(adult: $adult, backdropPath: $backdropPath, id: $id, name: $name, title: $title, originalLanguage: $originalLanguage, originalTitle: $originalTitle, originalName: $originalName, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, genreIds: $genreIds, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage, voteCount: $voteCount, originCountry: $originCountry)';
  }
}
