// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesDto _$ImagesDtoFromJson(Map<String, dynamic> json) => ImagesDto(
      logos: (json['logos'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      backdrops: (json['backdrops'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      posters: (json['posters'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
