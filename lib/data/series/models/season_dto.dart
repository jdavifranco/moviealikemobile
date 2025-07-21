import 'package:json_annotation/json_annotation.dart';

part 'season_dto.g.dart';

@JsonSerializable(createToJson: false)
class SeasonDto {
  @JsonKey(name: 'air_date')
  final String? airDate;
  @JsonKey(name: 'episode_count')
  final int episodeCount;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'season_number')
  final int seasonNumber;
  @JsonKey(name: 'vote_average')
  final double voteAverage;

  SeasonDto({
    this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory SeasonDto.fromJson(Map<String, dynamic> json) =>
      _$SeasonDtoFromJson(json);
}
