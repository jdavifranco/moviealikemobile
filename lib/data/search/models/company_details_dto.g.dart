// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDetailsDto _$CompanyDetailsDtoFromJson(Map<String, dynamic> json) => CompanyDetailsDto(
      description: json['description'] as String? ?? '',
      headquarters: json['headquarters'] as String? ?? '',
      homepage: json['homepage'] as String?,
      id: (json['id'] as num?)?.toInt() ?? 0,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String? ?? '',
      originCountry: json['origin_country'] as String? ?? '',
      parentCompany: (json['parent_company'] as num?)?.toInt(),
    );
