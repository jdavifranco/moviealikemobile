import 'package:injectable/injectable.dart';
import 'package:moviealike/data/youtube/models/youtube_search_response_dto.dart';
import 'package:moviealike/data/network_client/api_urls.dart';
import 'package:moviealike/data/network_client/network_service.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

@injectable
class YoutubeDataSource {
  final NetworkService _networkService;

  YoutubeDataSource(this._networkService);

  Future<Result<YoutubeSearchResponseDto, RequestError>>
      getYoutubeVideosByTitle(String title) async {
    final result = await _networkService.get(
      "${ApiUrls.youtubeBaseUrl}/search",
      queryParameters: {
        'part': 'snippet',
        'maxResults': '10',
        'q': "$title trailer",
        'type': 'video',
        'videoEmbeddable': 'true',
      },
    );

    return result.map((data) => YoutubeSearchResponseDto.fromJson(data));
  }
}
