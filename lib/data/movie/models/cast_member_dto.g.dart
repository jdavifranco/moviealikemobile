// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastMemberDto _$CastMemberDtoFromJson(Map<String, dynamic> json) =>
    CastMemberDto(
      adult: json['adult'] as bool? ?? false,
      gender: (json['gender'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      knownForDepartment: json['known_for_department'] as String? ?? '',
      name: json['name'] as String? ?? '',
      originalName: json['original_name'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
      profilePath: json['profile_path'] as String? ?? '',
      castId: (json['cast_id'] as num?)?.toInt() ?? 0,
      character: json['character'] as String? ?? '',
      creditId: json['credit_id'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
      job: json['job'] as String? ?? '',
    );
