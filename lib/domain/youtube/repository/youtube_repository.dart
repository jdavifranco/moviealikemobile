import 'package:moviealike/domain/movies/models/youtube_video.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

abstract class YoutubeRepository {
  Future<Result<List<YoutubeVideo>, RequestError>> getYoutubeVideosByTitle(
      String title);
}
