import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
part 'search_item_dto.g.dart';

@JsonSerializable(createToJson: false)
class SearchItemDto {
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  final int? id;
  final String? name;
  final String? title;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "original_name")
  final String? originalName;
  final String? overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "media_type")
  final String? mediaType;
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  final double? popularity;
  @JsonKey(name: "first_air_date")
  final String? firstAirDate;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;
  @JsonKey(name: 'release_date')
  final String? releaseDate;

  SearchItemDto({
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
    required this.releaseDate,
  });

  SearchItem toDomain() => SearchItem(
        adult: adult,
        backdropPath: backdropPath,
        id: id,
        name: name,
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        posterPath: posterPath,
        mediaType: mediaType,
        genreIds: genreIds,
        popularity: popularity,
        firstAirDate: firstAirDate ?? releaseDate,
        voteAverage: voteAverage,
        voteCount: voteCount,
        originCountry: originCountry,
        title: title,
        originalTitle: originalTitle,
      );
  factory SearchItemDto.fromJson(Map<String, dynamic> json) =>
      _$SearchItemDtoFromJson(json);
}
