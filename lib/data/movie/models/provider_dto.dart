import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/movies/models/movie_provider.dart';

part 'provider_dto.g.dart';

@JsonSerializable()
class ProviderDto {
  @JsonKey(name: 'logo_path')
  final String? logoPath;

  @JsonKey(name: 'provider_id')
  final int? providerId;

  @JsonKey(name: 'provider_name')
  final String? providerName;

  @JsonKey(name: 'display_priority')
  final int? displayPriority;

  ProviderDto({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory ProviderDto.fromJson(Map<String, dynamic> json) =>
      _$ProviderDtoFromJson(json);

  MovieProvider toDomain(String? link) => MovieProvider(
      logoPath: logoPath,
      providerId: providerId,
      providerName: providerName,
      link: link);
}
