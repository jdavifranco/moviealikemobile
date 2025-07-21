import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/movies/models/youtube_video.dart';
import 'package:moviealike/data/youtube/models/page_info_dto.dart';
import 'package:moviealike/data/youtube/models/youtube_video_item_dto.dart';

part 'youtube_search_response_dto.g.dart';

@JsonSerializable()
class YoutubeSearchResponseDto {
  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final String? regionCode;
  final PageInfoDto? pageInfo;
  final List<YoutubeVideoItemDto>? items;

  YoutubeSearchResponseDto({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.items,
  });

  List<YoutubeVideo> toDomain() {
    return items
            ?.map((item) {
              final id = item.id?.videoId ?? '';
              final snippet = item.snippet;
              return YoutubeVideo(
                id: id,
                title: snippet?.title ?? '',
                description: snippet?.description,
                thumbnailUrl: snippet?.thumbnails?.high?.url ??
                    snippet?.thumbnails?.medium?.url ??
                    snippet?.thumbnails?.thumbnailDefault?.url,
                channelTitle: snippet?.channelTitle,
                duration: null,
              );
            })
            .where((video) => video.id.isNotEmpty)
            .toList() ??
        [];
  }

  factory YoutubeSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$YoutubeSearchResponseDtoFromJson(json);
}
