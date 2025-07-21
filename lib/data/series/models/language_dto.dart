import 'package:json_annotation/json_annotation.dart';

part 'language_dto.g.dart';

@JsonSerializable(createToJson: false)
class LanguageDto {
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'english_name')
  final String englishName;
  @JsonKey(name: 'name')
  final String name;

  LanguageDto({
    required this.iso6391,
    required this.englishName,
    required this.name,
  });

  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);
}
