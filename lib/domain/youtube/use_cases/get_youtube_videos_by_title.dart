import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/youtube_video.dart';
import 'package:moviealike/domain/youtube/repository/youtube_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetYoutubeVideosByTitle {
  final YoutubeRepository repository;

  GetYoutubeVideosByTitle(this.repository);

  Future<Result<List<YoutubeVideo>, RequestError>> call(String title) =>
      repository.getYoutubeVideosByTitle(title);
}
