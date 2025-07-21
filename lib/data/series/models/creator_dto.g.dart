// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorDto _$CreatorDtoFromJson(Map<String, dynamic> json) => CreatorDto(
      id: (json['id'] as num).toInt(),
      creditId: json['credit_id'] as String,
      name: json['name'] as String,
      gender: (json['gender'] as num).toInt(),
      profilePath: json['profile_path'] as String?,
    );
