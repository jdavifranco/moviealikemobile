// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/domain/movies/repository/movie_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetPopularMovies {
  final MovieRepository _movieRepository;

  GetPopularMovies(
    this._movieRepository,
  );

  Future<Result<List<Movie>, RequestError>> call({int limit = 20}) =>
      _movieRepository.getPopularMovies(limit);
}
