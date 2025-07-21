import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/series/models/serie_dto.dart';
part 'series_results_dto.g.dart';

@JsonSerializable(createToJson: false)
class SeriesResultsDto {
  final List<SerieDto> results;

  SeriesResultsDto({required this.results});

  factory SeriesResultsDto.fromJson(Map<String, dynamic> json) =>
      _$SeriesResultsDtoFromJson(json);
}
