import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';
import 'package:moviealike/domain/movies/models/movie_images.dart';
import 'package:moviealike/domain/movies/models/movie_keyword.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';
import 'package:moviealike/domain/movies/models/watch_providers.dart';
import 'package:result_type/result_type.dart';

abstract class MovieRepository {
  Future<Result<List<Movie>, RequestError>> getPopularMovies(int limit);
  Future<Result<List<Movie>, RequestError>> getMoviesWithGenres(
      List<int> genreIds);
  Future<Result<List<Movie>, RequestError>> getMoviesWithKeywords(
      List<int> keywords, List<int> genreIds);
  Future<Result<List<Movie>, RequestError>> getUpcomingMovies();
  Future<Result<MovieDetails, RequestError>> getMovieDetails(int movieId);
  Future<Result<MovieImages, RequestError>> getMovieImages(int movieId);
  Future<Result<WatchProviders, RequestError>> getMovieProviders(int movieId);
  Future<Result<List<CastMember>, RequestError>> getCastCrewMembers(
      int movieId);
  Future<Result<List<MovieVideo>, RequestError>> getMovieYoutubeVideos(
      int movieId);
  Future<Result<List<MovieKeyword>, RequestError>> getMovieKeywords(
      int movieId);
}
