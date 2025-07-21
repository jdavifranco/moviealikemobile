import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';

part 'cast_member_dto.g.dart';

@JsonSerializable(createToJson: false)
class CastMemberDto {
  @JsonKey(name: 'adult', defaultValue: false)
  final bool adult;
  @JsonKey(name: 'gender', defaultValue: 0)
  final int gender;
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'known_for_department', defaultValue: "")
  final String knownForDepartment;
  @JsonKey(name: 'name', defaultValue: "")
  final String name;
  @JsonKey(name: 'original_name', defaultValue: "")
  final String originalName;
  @JsonKey(name: 'popularity', defaultValue: 0)
  final double popularity;
  @JsonKey(name: 'profile_path', defaultValue: "")
  final String? profilePath;
  @JsonKey(name: 'cast_id', defaultValue: 0)
  final int? castId;
  @JsonKey(name: 'character', defaultValue: "")
  final String character;
  @JsonKey(name: 'credit_id', defaultValue: "")
  final String creditId;
  @JsonKey(name: 'order', defaultValue: 0)
  final int? order;
  @JsonKey(name: 'job', defaultValue: "")
  final String? job;

  CastMemberDto({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    this.job,
  });

  factory CastMemberDto.fromJson(Map<String, dynamic> json) =>
      _$CastMemberDtoFromJson(json);

  CastMember toDomain() => CastMember(
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        castId: castId,
        character: character,
        creditId: creditId,
        order: order,
        profilePath: profilePath,
        job: job,
      );
}
