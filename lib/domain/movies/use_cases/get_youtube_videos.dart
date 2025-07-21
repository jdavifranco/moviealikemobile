// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';
import 'package:moviealike/domain/movies/repository/movie_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetYoutubeVideos {
  final MovieRepository _movieRepository;

  GetYoutubeVideos(
    this._movieRepository,
  );

  Future<Result<List<MovieVideo>, RequestError>> call(int movieId) =>
      _movieRepository.getMovieYoutubeVideos(movieId);
}
