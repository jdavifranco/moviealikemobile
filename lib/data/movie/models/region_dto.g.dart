// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionDto _$RegionDtoFromJson(Map<String, dynamic> json) => RegionDto(
      link: json['link'] as String?,
      rent: (json['rent'] as List<dynamic>?)
          ?.map((e) => ProviderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      buy: (json['buy'] as List<dynamic>?)
          ?.map((e) => ProviderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      flatrate: (json['flatrate'] as List<dynamic>?)
          ?.map((e) => ProviderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
