import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/data/movie/models/cast_member_dto.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';

part 'cast_crew_members_dto.g.dart';

@JsonSerializable(createToJson: false)
class CastCrewMembersDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'cast')
  final List<CastMemberDto> cast;
  @JsonKey(name: 'crew')
  final List<CastMemberDto> crew;

  CastCrewMembersDto({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastCrewMembersDto.fromJson(Map<String, dynamic> json) =>
      _$CastCrewMembersDtoFromJson(json);

  List<CastMember> toDomain() {
    final director = crew
        .where((element) => element.job == 'Director')
        .toList()
        .map((e) => e.toDomain())
        .toList();

    return [...director, ...(cast.map((e) => e.toDomain()).toList())];
  }
}
