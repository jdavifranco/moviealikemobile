import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/search/models/company_details.dart';

part 'company_details_dto.g.dart';

@JsonSerializable(createToJson: false)
class CompanyDetailsDto {
  @JsonKey(name: 'description', defaultValue: "")
  final String description;
  @JsonKey(name: 'headquarters', defaultValue: "")
  final String headquarters;
  @JsonKey(name: 'homepage')
  final String? homepage;
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'name', defaultValue: "")
  final String name;
  @JsonKey(name: 'origin_country', defaultValue: "")
  final String originCountry;
  @JsonKey(name: 'parent_company')
  final int? parentCompany;

  CompanyDetailsDto({
    required this.description,
    required this.headquarters,
    this.homepage,
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
    this.parentCompany,
  });

  factory CompanyDetailsDto.fromJson(Map<String, dynamic> json) => _$CompanyDetailsDtoFromJson(json);

  CompanyDetails toDomain() => CompanyDetails(
        description: description,
        headquarters: headquarters,
        homepage: homepage,
        id: id,
        logoPath: logoPath,
        name: name,
        originCountry: originCountry,
        parentCompany: parentCompany,
      );
}
