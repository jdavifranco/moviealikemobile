// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanyDto _$ProductionCompanyDtoFromJson(
        Map<String, dynamic> json) =>
    ProductionCompanyDto(
      id: (json['id'] as num).toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String,
      originCountry: json['origin_country'] as String,
    );
