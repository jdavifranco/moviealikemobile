// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';
import 'package:moviealike/domain/movies/repository/movie_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetMovieDetails {
  final MovieRepository _movieRepository;

  GetMovieDetails(
    this._movieRepository,
  );

  Future<Result<MovieDetails, RequestError>> call(int movieId) =>
      _movieRepository.getMovieDetails(movieId);
}
