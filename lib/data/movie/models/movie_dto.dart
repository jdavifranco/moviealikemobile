import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/search/models/search_item_dto.dart';
import 'package:moviealike/domain/movies/models/movie.dart';


part 'movie_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovieDto {
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

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'video')
  final bool? video;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  MovieDto({
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

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  Movie toDomain() => Movie(
        adult: adult,
        backdropPath: backdropPath,
        id: id,
        genreIds: genreIds,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate?.split("-").first,
        title: title,
        video: video,
        voteAverage: voteAverage?.roundToDouble(),
        voteCount: voteCount,
      );

  SearchItemDto toSearchItem()=> SearchItemDto(
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
        firstAirDate: releaseDate?.split("-").first,
        voteAverage: voteAverage?.roundToDouble(),
        voteCount: voteCount,
        originCountry: [],
    title: title,
    originalTitle: originalTitle,
    releaseDate: releaseDate,
      );

}
