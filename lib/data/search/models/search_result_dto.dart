import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/search/models/search_item_dto.dart';
part 'search_result_dto.g.dart';

@JsonSerializable(createToJson: false)
class SearchResultsDto {
  final List<SearchItemDto> results;

  SearchResultsDto({required this.results});

  factory SearchResultsDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsDtoFromJson(json);
}
