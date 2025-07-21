import 'package:json_annotation/json_annotation.dart';

part 'network_dto.g.dart';

@JsonSerializable(createToJson: false)
class NetworkDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'logo_path')
  final String? logoPath;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  NetworkDto({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory NetworkDto.fromJson(Map<String, dynamic> json) =>
      _$NetworkDtoFromJson(json);
}
