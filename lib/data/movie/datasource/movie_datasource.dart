import 'package:injectable/injectable.dart';
import 'package:moviealike/data/movie/models/cast_crew_members_dto.dart';
import 'package:moviealike/data/movie/models/images_dto.dart';
import 'package:moviealike/data/movie/models/movie_details_dto.dart';
import 'package:moviealike/data/movie/models/movie_dto.dart';
import 'package:moviealike/data/movie/models/movie_keyword_dto.dart';
import 'package:moviealike/data/movie/models/movie_keywords_dto.dart';
import 'package:moviealike/data/movie/models/movie_results_dto.dart';
import 'package:moviealike/data/movie/models/movie_video_response_dto.dart';
import 'package:moviealike/data/movie/models/watch_provider_dto.dart';
import 'package:moviealike/data/network_client/network_service.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/di/language_module.dart';
import 'package:result_type/result_type.dart';

@injectable
class MovieDataSource {
  final NetworkService _networkService;
  final UserLanguage _userLanguage;

  MovieDataSource(this._networkService, this._userLanguage);

  Future<Result<List<MovieDto>, RequestError>> getUpcomingMovies() async {
    final result = await _networkService.get(
      "/movie/upcoming",
      queryParameters: {
        'language': _userLanguage.name,
        'page': '1',
      },
    );

    return result.map((data) => MovieResultsDto.fromJson(data).results);
  }

  Future<Result<List<MovieDto>, RequestError>> getMoviesWithGenres(
      List<int> genreIds) async {
    final result = await _networkService.get(
      "/discover/movie",
      queryParameters: {
        'include_adult': 'false',
        'include_video': 'false',
        'language': _userLanguage.name,
        'page': '1',
        'sort_by': 'popularity.desc',
        'with_genres': _formatGenresForQuery(genreIds),
      },
    );

    return result.map((data) => MovieResultsDto.fromJson(data).results);
  }

  Future<Result<List<MovieDto>, RequestError>> getPopularMovies(
      int limit) async {
    final result = await _networkService.get(
      "/movie/popular",
      queryParameters: {
        'language': _userLanguage.name,
        'page': '1',
      },
    );

    return result.map((data) => MovieResultsDto.fromJson(data).results);
  }

  Future<Result<MovieDetailsDto, RequestError>> getMovieDetails(
      int movieId) async {
    var result = await _networkService.get(
      "/movie/$movieId",
      queryParameters: {
        'language': _userLanguage.name,
      },
    );
    final movieDetailsDto = MovieDetailsDto.fromJson(result.unwrapOr({}));

    if (movieDetailsDto.overview.isEmpty) {
      result = await _networkService.get(
        "/movie/$movieId",
        queryParameters: {
          'language': 'en-US',
        },
      );
    }

    return result.map((data) => MovieDetailsDto.fromJson(data));
  }

  Future<Result<ImagesDto, RequestError>> getMovieImages(int movieId) async {
    final result = await _networkService.get(
      "/movie/$movieId/images",
      queryParameters: {
        'language': _userLanguage.name,
      },
    );

    return result.map((data) => ImagesDto.fromJson(data));
  }

  Future<Result<WatchProviderDto, RequestError>> getMovieProviders(
      int movieId) async {
    final result = await _networkService.get(
      "/movie/$movieId/watch/providers",
    );

    return result.map((data) => WatchProviderDto.fromJson(data));
  }

  Future<Result<CastCrewMembersDto, RequestError>> getCastCrewMembers(
      int movieId) async {
    final result = await _networkService.get(
      "/movie/$movieId/credits",
      queryParameters: {
        'language': _userLanguage.name,
      },
    );

    return result.map((data) => CastCrewMembersDto.fromJson(data));
  }

  Future<Result<MovieVideoResponseDto, RequestError>> getMovieYoutubeVideos(
      int movieId) async {
    final result = await _networkService.get(
      "/movie/$movieId/videos",
    );

    return result.map((data) => MovieVideoResponseDto.fromJson(data));
  }

  Future<Result<List<MovieKeywordDto>, RequestError>> getMovieKeywords(
      int movieId) async {
    final result = await _networkService.get(
      "/movie/$movieId/keywords",
    );

    return result.map((data) => MovieKeywordsDto.fromJson(data).keywords);
  }

  Future<Result<List<MovieDto>, RequestError>> getMoviesWithKeywords(
      List<int> keywords, List<int> genreIds) async {
    final result = await _networkService.get(
      "/discover/movie",
      queryParameters: {
        'include_adult': 'false',
        'include_video': 'false',
        'language': _userLanguage.name,
        'page': '1',
        'sort_by': 'popularity.desc',
        'with_keywords': _formatKeywordsForQuery(keywords),
        'with_genres': _formatGenresForQuery(genreIds),
      },
    );

    return result.map((data) => MovieResultsDto.fromJson(data).results);
  }

  String _formatKeywordsForQuery(List<int> keywords) {
    return keywords
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(",", "|");
  }

  String _formatGenresForQuery(List<int> genres) {
    return genres.toString().replaceAll("[", "").replaceAll("]", "");
  }
}
