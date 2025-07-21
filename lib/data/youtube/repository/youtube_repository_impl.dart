import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/youtube/datasource/youtube_data_source.dart';
import 'package:moviealike/domain/movies/models/youtube_video.dart';
import 'package:moviealike/domain/youtube/repository/youtube_repository.dart';
import 'package:result_type/result_type.dart';

@Injectable(as: YoutubeRepository)
class YoutubeRepositoryImpl implements YoutubeRepository {
  final YoutubeDataSource youtubeDataSource;

  YoutubeRepositoryImpl(this.youtubeDataSource);

  @override
  Future<Result<List<YoutubeVideo>, RequestError>> getYoutubeVideosByTitle(
      String title) async {
    final result = await youtubeDataSource.getYoutubeVideosByTitle(title);
    return result.map((data) => data.toDomain());
  }
}
