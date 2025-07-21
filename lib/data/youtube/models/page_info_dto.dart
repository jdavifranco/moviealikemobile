import 'package:json_annotation/json_annotation.dart';

part 'page_info_dto.g.dart';

@JsonSerializable()
class PageInfoDto {
  final int? totalResults;
  final int? resultsPerPage;

  PageInfoDto({this.totalResults, this.resultsPerPage});

  factory PageInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PageInfoDtoFromJson(json);
}
