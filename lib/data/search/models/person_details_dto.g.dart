// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDetailsDto _$PersonDetailsDtoFromJson(Map<String, dynamic> json) =>
    PersonDetailsDto(
      adult: json['adult'] as bool? ?? false,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      biography: json['biography'] as String? ?? '',
      birthday: json['birthday'] as String?,
      deathday: json['deathday'] as String?,
      gender: (json['gender'] as num?)?.toInt() ?? 0,
      homepage: json['homepage'] as String?,
      id: (json['id'] as num?)?.toInt() ?? 0,
      imdbId: json['imdb_id'] as String?,
      knownForDepartment: json['known_for_department'] as String? ?? '',
      name: json['name'] as String? ?? '',
      placeOfBirth: json['place_of_birth'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      profilePath: json['profile_path'] as String?,
    );
