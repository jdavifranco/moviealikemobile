// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_crew_members_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastCrewMembersDto _$CastCrewMembersDtoFromJson(Map<String, dynamic> json) =>
    CastCrewMembersDto(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastMemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => CastMemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
