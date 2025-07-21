import 'package:json_annotation/json_annotation.dart';
part 'production_company_dto.g.dart';

@JsonSerializable(createToJson: false)
class ProductionCompanyDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  ProductionCompanyDto({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyDtoFromJson(json);
}
