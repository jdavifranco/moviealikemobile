// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_provider_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchProviderDto _$WatchProviderDtoFromJson(Map<String, dynamic> json) =>
    WatchProviderDto(
      id: (json['id'] as num?)?.toInt(),
      results: (json['results'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, RegionDto.fromJson(e as Map<String, dynamic>)),
      ),
    );
