import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/search/models/person_details.dart';

part 'person_details_dto.g.dart';

@JsonSerializable(createToJson: false)
class PersonDetailsDto {
  @JsonKey(name: 'adult', defaultValue: false)
  final bool adult;
  @JsonKey(name: 'also_known_as', defaultValue: <String>[])
  final List<String> alsoKnownAs;
  @JsonKey(name: 'biography', defaultValue: "")
  final String biography;
  @JsonKey(name: 'birthday')
  final String? birthday;
  @JsonKey(name: 'deathday')
  final String? deathday;
  @JsonKey(name: 'gender', defaultValue: 0)
  final int gender;
  @JsonKey(name: 'homepage')
  final String? homepage;
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  @JsonKey(name: 'known_for_department', defaultValue: "")
  final String knownForDepartment;
  @JsonKey(name: 'name', defaultValue: "")
  final String name;
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  @JsonKey(name: 'popularity', defaultValue: 0.0)
  final double popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  PersonDetailsDto({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    this.birthday,
    this.deathday,
    required this.gender,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.knownForDepartment,
    required this.name,
    this.placeOfBirth,
    required this.popularity,
    this.profilePath,
  });

  factory PersonDetailsDto.fromJson(Map<String, dynamic> json) => _$PersonDetailsDtoFromJson(json);

  PersonDetails toDomain() => PersonDetails(
        adult: adult,
        alsoKnownAs: alsoKnownAs,
        biography: biography,
        birthday: birthday,
        deathday: deathday,
        gender: gender,
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        knownForDepartment: knownForDepartment,
        name: name,
        placeOfBirth: placeOfBirth,
        popularity: popularity,
        profilePath: profilePath,
      );
}
