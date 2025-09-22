// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:moviealike/data/database/app_database.dart' as _i436;
import 'package:moviealike/data/movie/datasource/movie_datasource.dart'
    as _i906;
import 'package:moviealike/data/movie/repository/movie_repository_impl.dart'
    as _i835;
import 'package:moviealike/data/network_client/authorization_interceptor.dart'
    as _i860;
import 'package:moviealike/data/network_client/network_service.dart' as _i327;
import 'package:moviealike/data/recommendations/datasource/recommendations_data_source.dart'
    as _i393;
import 'package:moviealike/data/recommendations/repository/recommendations_repository_impl.dart'
    as _i488;
import 'package:moviealike/data/search/datasource/search_data_source.dart'
    as _i728;
import 'package:moviealike/data/search/repository/search_repository_impl.dart'
    as _i1038;
import 'package:moviealike/data/series/datasource/series_data_source.dart'
    as _i596;
import 'package:moviealike/data/series/repository/serie_repository_impl.dart'
    as _i766;
import 'package:moviealike/data/watchlist/datasource/watch_list_data_source.dart'
    as _i771;
import 'package:moviealike/data/watchlist/repository/watch_list_repository_impl.dart'
    as _i652;
import 'package:moviealike/data/youtube/datasource/youtube_data_source.dart'
    as _i1012;
import 'package:moviealike/data/youtube/repository/youtube_repository_impl.dart'
    as _i684;
import 'package:moviealike/di/drift_module.dart' as _i858;
import 'package:moviealike/di/language_module.dart' as _i289;
import 'package:moviealike/di/network_module.dart' as _i543;
import 'package:moviealike/di/path_module.dart' as _i74;
import 'package:moviealike/domain/dialog_service/dialog_service.dart' as _i788;
import 'package:moviealike/domain/movies/repository/movie_repository.dart'
    as _i562;
import 'package:moviealike/domain/movies/use_cases/get_cast_members.dart'
    as _i931;
import 'package:moviealike/domain/movies/use_cases/get_movie_details.dart'
    as _i992;
import 'package:moviealike/domain/movies/use_cases/get_movies_with_genres.dart'
    as _i1029;
import 'package:moviealike/domain/movies/use_cases/get_popular_movies.dart'
    as _i765;
import 'package:moviealike/domain/movies/use_cases/get_upcoming_movies.dart'
    as _i911;
import 'package:moviealike/domain/movies/use_cases/get_youtube_videos.dart'
    as _i773;
import 'package:moviealike/domain/recommendations/repository/recommendations_repository.dart'
    as _i659;
import 'package:moviealike/domain/recommendations/use_cases/get_movie_analysis.dart'
    as _i986;
import 'package:moviealike/domain/recommendations/use_cases/get_movie_recommendations.dart'
    as _i12;
import 'package:moviealike/domain/search/repository/search_repository.dart'
    as _i1067;
import 'package:moviealike/domain/search/use_cases/search_movie_by_title.dart'
    as _i408;
import 'package:moviealike/domain/search/use_cases/search_movie_with_filter.dart'
    as _i13;
import 'package:moviealike/domain/series/repository/serie_repository.dart'
    as _i243;
import 'package:moviealike/domain/series/use_cases/get_popular_series.dart'
    as _i143;
import 'package:moviealike/domain/series/use_cases/get_upcoming_series.dart'
    as _i484;
import 'package:moviealike/domain/watchlist/repository/watch_list_repository.dart'
    as _i608;
import 'package:moviealike/domain/watchlist/use_cases/add_to_watch_list.dart'
    as _i681;
import 'package:moviealike/domain/watchlist/use_cases/get_watch_list.dart'
    as _i488;
import 'package:moviealike/domain/watchlist/use_cases/get_watch_list_stream.dart'
    as _i302;
import 'package:moviealike/domain/watchlist/use_cases/is_movie_in_watchlist.dart'
    as _i919;
import 'package:moviealike/domain/watchlist/use_cases/remove_from_watch_list.dart'
    as _i83;
import 'package:moviealike/domain/youtube/repository/youtube_repository.dart'
    as _i225;
import 'package:moviealike/domain/youtube/use_cases/get_youtube_videos_by_title.dart'
    as _i27;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final languageModule = _$LanguageModule();
  final driftModule = _$DriftModule();
  final networkModule = _$NetworkModule();
  final pathModule = _$PathModule();
  gh.factory<_i289.UserLanguage>(() => languageModule.getUserLanguage());
  await gh.singletonAsync<_i436.AppDatabase>(
    () => driftModule.openConnection(),
    preResolve: true,
  );
  gh.singleton<_i788.DialogService>(() => _i788.DialogService());
  gh.lazySingleton<_i860.AuthorizationInterceptor>(
      () => networkModule.getAuthorizationInterceptor());
  await gh.singletonAsync<_i497.Directory>(
    () => pathModule.getInternalDocument(),
    instanceName: 'InternalDocuments',
    preResolve: true,
  );
  gh.factory<_i771.WatchlistDataSource>(
      () => _i771.WatchlistDataSource(gh<_i436.AppDatabase>()));
  gh.lazySingleton<_i361.Dio>(
      () => networkModule.getDio(gh<_i860.AuthorizationInterceptor>()));
  gh.lazySingleton<_i327.NetworkService>(
      () => networkModule.getNetworkService(gh<_i361.Dio>()));
  gh.factory<_i608.WatchListRepository>(
      () => _i652.WatchListRepositoryImpl(gh<_i771.WatchlistDataSource>()));
  gh.factory<_i906.MovieDataSource>(() => _i906.MovieDataSource(
        gh<_i327.NetworkService>(),
        gh<_i289.UserLanguage>(),
      ));
  gh.factory<_i728.SearchDataSource>(() => _i728.SearchDataSource(
        gh<_i327.NetworkService>(),
        gh<_i289.UserLanguage>(),
      ));
  gh.factory<_i1067.SearchRepository>(
      () => _i1038.SearchRepositoryImpl(gh<_i728.SearchDataSource>()));
  gh.factory<_i393.RecommendationsDataSource>(
      () => _i393.RecommendationsDataSource(gh<_i327.NetworkService>()));
  gh.factory<_i596.SeriesDataSource>(
      () => _i596.SeriesDataSource(gh<_i327.NetworkService>()));
  gh.factory<_i1012.YoutubeDataSource>(
      () => _i1012.YoutubeDataSource(gh<_i327.NetworkService>()));
  gh.factory<_i562.MovieRepository>(
      () => _i835.MovieRepositoryImpl(gh<_i906.MovieDataSource>()));
  gh.factory<_i659.RecommendationsRepository>(() =>
      _i488.RecommendationsRepositoryImpl(
          gh<_i393.RecommendationsDataSource>()));
  gh.factory<_i681.AddToWatchList>(
      () => _i681.AddToWatchList(gh<_i608.WatchListRepository>()));
  gh.factory<_i488.GetWatchList>(
      () => _i488.GetWatchList(gh<_i608.WatchListRepository>()));
  gh.factory<_i302.GetWatchListStream>(
      () => _i302.GetWatchListStream(gh<_i608.WatchListRepository>()));
  gh.factory<_i919.IsMovieInWatchList>(
      () => _i919.IsMovieInWatchList(gh<_i608.WatchListRepository>()));
  gh.factory<_i83.RemoveFromWatchList>(
      () => _i83.RemoveFromWatchList(gh<_i608.WatchListRepository>()));
  gh.factory<_i408.SearchMovieByTitle>(
      () => _i408.SearchMovieByTitle(gh<_i1067.SearchRepository>()));
  gh.factory<_i13.SearchMovieWithFilter>(
      () => _i13.SearchMovieWithFilter(gh<_i1067.SearchRepository>()));
  gh.factory<_i931.GetCastMembers>(
      () => _i931.GetCastMembers(gh<_i562.MovieRepository>()));
  gh.factory<_i1029.GetMoviesWithGenres>(
      () => _i1029.GetMoviesWithGenres(gh<_i562.MovieRepository>()));
  gh.factory<_i992.GetMovieDetails>(
      () => _i992.GetMovieDetails(gh<_i562.MovieRepository>()));
  gh.factory<_i765.GetPopularMovies>(
      () => _i765.GetPopularMovies(gh<_i562.MovieRepository>()));
  gh.factory<_i911.GetUpcomingMovies>(
      () => _i911.GetUpcomingMovies(gh<_i562.MovieRepository>()));
  gh.factory<_i773.GetYoutubeVideos>(
      () => _i773.GetYoutubeVideos(gh<_i562.MovieRepository>()));
  gh.factory<_i225.YoutubeRepository>(
      () => _i684.YoutubeRepositoryImpl(gh<_i1012.YoutubeDataSource>()));
  gh.factory<_i27.GetYoutubeVideosByTitle>(
      () => _i27.GetYoutubeVideosByTitle(gh<_i225.YoutubeRepository>()));
  gh.factory<_i243.SeriesRepository>(
      () => _i766.SeriesRepositoryImpl(gh<_i596.SeriesDataSource>()));
  gh.factory<_i986.GetMovieAnaysis>(
      () => _i986.GetMovieAnaysis(gh<_i659.RecommendationsRepository>()));
  gh.factory<_i12.GetMovieRecommendations>(() =>
      _i12.GetMovieRecommendations(gh<_i659.RecommendationsRepository>()));
  gh.factory<_i143.GetPopularSeries>(
      () => _i143.GetPopularSeries(gh<_i243.SeriesRepository>()));
  gh.factory<_i484.GetUpcomingSeries>(
      () => _i484.GetUpcomingSeries(gh<_i243.SeriesRepository>()));
  return getIt;
}

class _$LanguageModule extends _i289.LanguageModule {}

class _$DriftModule extends _i858.DriftModule {}

class _$NetworkModule extends _i543.NetworkModule {}

class _$PathModule extends _i74.PathModule {}
