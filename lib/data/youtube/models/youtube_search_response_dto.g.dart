// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeSearchResponseDto _$YoutubeSearchResponseDtoFromJson(
        Map<String, dynamic> json) =>
    YoutubeSearchResponseDto(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      regionCode: json['regionCode'] as String?,
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfoDto.fromJson(json['pageInfo'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => YoutubeVideoItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
