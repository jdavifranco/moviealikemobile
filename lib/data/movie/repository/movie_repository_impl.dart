import 'package:injectable/injectable.dart';
import 'package:moviealike/data/movie/datasource/movie_datasource.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';
import 'package:moviealike/domain/movies/models/movie_images.dart';
import 'package:moviealike/domain/movies/models/movie_keyword.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';
import 'package:moviealike/domain/movies/models/watch_providers.dart';
import 'package:moviealike/domain/movies/repository/movie_repository.dart';
import 'package:result_type/result_type.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl(this.movieDataSource);

  @override
  Future<Result<List<Movie>, RequestError>> getPopularMovies(int limit) async {
    final result = await movieDataSource.getPopularMovies(limit);

    return result.map((movieDtos) =>
        movieDtos.map((movieDto) => movieDto.toDomain()).toList());
  }

  @override
  Future<Result<List<Movie>, RequestError>> getMoviesWithGenres(
      List<int> genreIds) async {
    final result = await movieDataSource.getMoviesWithGenres(genreIds);

    return result.map((movieDtos) =>
        movieDtos.map((movieDto) => movieDto.toDomain()).toList());
  }

  @override
  Future<Result<List<Movie>, RequestError>> getMoviesWithKeywords(
    List<int> keywords,
    List<int> genreIds,
  ) async {
    final result =
        await movieDataSource.getMoviesWithKeywords(keywords, genreIds);

    return result.map((movieDtos) =>
        movieDtos.map((movieDto) => movieDto.toDomain()).toList());
  }

  @override
  Future<Result<List<Movie>, RequestError>> getUpcomingMovies() async {
    final result = await movieDataSource.getUpcomingMovies();

    return result.map((movieDtos) =>
        movieDtos.map((movieDto) => movieDto.toDomain()).toList());
  }

  @override
  Future<Result<MovieDetails, RequestError>> getMovieDetails(
      int movieId) async {
    final movieDetailsResult = await movieDataSource.getMovieDetails(movieId);

    Result<MovieImages, RequestError>? movieImagesResult;
    Result<WatchProviders, RequestError>? watchProvidersResult;

    if (movieDetailsResult.isSuccess) {
      movieImagesResult = await getMovieImages(movieId);
      watchProvidersResult = await getMovieProviders(movieId);
    }
    return movieDetailsResult.map((movieDetailsDto) {
      final movieImages = movieImagesResult?.unwrapOr(MovieImages(
        backdrops: [],
        posters: [],
        logos: [],
      ));

      final watchProviders = watchProvidersResult?.unwrapOr(WatchProviders(
        watchProviders: [],
      ));

      return movieDetailsDto.toDomain(movieImages, watchProviders);
    });
  }

  @override
  Future<Result<MovieImages, RequestError>> getMovieImages(int movieId) async {
    final result = await movieDataSource.getMovieImages(movieId);

    return result.map((imagesDto) => imagesDto.toDomain());
  }

  @override
  Future<Result<WatchProviders, RequestError>> getMovieProviders(
      int movieId) async {
    final result = await movieDataSource.getMovieProviders(movieId);

    return result.map((watchProviderDto) => watchProviderDto.toDomain());
  }

  @override
  Future<Result<List<CastMember>, RequestError>> getCastCrewMembers(
      int movieId) async {
    final result = await movieDataSource.getCastCrewMembers(movieId);

    return result.map((castCrewMembersDto) => castCrewMembersDto.toDomain());
  }

  @override
  Future<Result<List<MovieVideo>, RequestError>> getMovieYoutubeVideos(
      int movieId) async {
    final result = await movieDataSource.getMovieYoutubeVideos(movieId);

    return result
        .map((movieVideoResponseDto) => movieVideoResponseDto.toDomain());
  }

  @override
  Future<Result<List<MovieKeyword>, RequestError>> getMovieKeywords(
      int movieId) async {
    final result = await movieDataSource.getMovieKeywords(movieId);

    return result.map((movieKeywordDtos) =>
        movieKeywordDtos.map((e) => e.toDomain()).toList());
  }
}
