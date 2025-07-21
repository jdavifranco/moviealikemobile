import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/movies/models/watch_providers.dart';
import 'region_dto.dart';

part 'watch_provider_dto.g.dart';

@JsonSerializable()
class WatchProviderDto {
  final int? id;
  final Map<String, RegionDto>? results;

  WatchProviderDto({
    this.id,
    this.results,
  });

  factory WatchProviderDto.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderDtoFromJson(json);

  //TODO: use the user language here
  WatchProviders toDomain() {
    final regionProvider = results?["BR"];

    return WatchProviders(
        watchProviders: regionProvider?.flatrate
                ?.map((e) => e.toDomain(regionProvider.link))
                .toList() ??
            []);
  }
}
