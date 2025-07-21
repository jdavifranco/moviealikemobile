import 'package:json_annotation/json_annotation.dart';
import 'provider_dto.dart';

part 'region_dto.g.dart';

@JsonSerializable()
class RegionDto {
  final String? link;
  final List<ProviderDto>? rent;
  final List<ProviderDto>? buy;
  final List<ProviderDto>? flatrate;

  RegionDto({
    this.link,
    this.rent,
    this.buy,
    this.flatrate,
  });

  factory RegionDto.fromJson(Map<String, dynamic> json) =>
      _$RegionDtoFromJson(json);
}
