import 'package:json_annotation/json_annotation.dart';

part 'creator_dto.g.dart';

@JsonSerializable(createToJson: false)
class CreatorDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'credit_id')
  final String creditId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'gender')
  final int gender;
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  CreatorDto({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    this.profilePath,
  });

  factory CreatorDto.fromJson(Map<String, dynamic> json) =>
      _$CreatorDtoFromJson(json);
}
