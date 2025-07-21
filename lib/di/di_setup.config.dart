// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i7;

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moviealike/data/database/app_database.dart' as _i3;
import 'package:moviealike/data/movie/datasource/movie_datasource.dart' as _i25;
import 'package:moviealike/data/movie/repository/movie_repository_impl.dart'
    as _i27;
import 'package:moviealike/data/network_client/authorization_interceptor.dart'
    as _i4;
import 'package:moviealike/data/network_client/network_service.dart' as _i8;
import 'package:moviealike/data/recommendations/datasource/recommendations_data_source.dart'
    as _i9;
import 'package:moviealike/data/recommendations/repository/recommendations_repository_impl.dart'
    as _i11;
import 'package:moviealike/data/search/datasource/search_data_source.dart'
    as _i28;
import 'package:moviealike/data/search/repository/search_repository_impl.dart'
    as _i30;
import 'package:moviealike/data/series/datasource/series_data_source.dart'
    as _i12;
import 'package:moviealike/data/series/repository/serie_repository_impl.dart'
    as _i14;
import 'package:moviealike/data/watchlist/datasource/watch_list_data_source.dart'
    as _i16;
import 'package:moviealike/data/watchlist/repository/watch_list_repository_impl.dart'
    as _i32;
import 'package:moviealike/data/youtube/datasource/youtube_data_source.dart'
    as _i17;
import 'package:moviealike/data/youtube/repository/youtube_repository_impl.dart'
    as _i19;
import 'package:moviealike/di/drift_module.dart' as _i46;
import 'package:moviealike/di/language_module.dart' as _i15;
import 'package:moviealike/di/network_module.dart' as _i47;
import 'package:moviealike/di/path_module.dart' as _i48;
import 'package:moviealike/domain/dialog_service/dialog_service.dart' as _i5;
import 'package:moviealike/domain/movies/repository/movie_repository.dart'
    as _i26;
import 'package:moviealike/domain/movies/use_cases/get_cast_members.dart'
    as _i34;
import 'package:moviealike/domain/movies/use_cases/get_movie_details.dart'
    as _i35;
import 'package:moviealike/domain/movies/use_cases/get_movies_with_genres.dart'
    as _i36;
import 'package:moviealike/domain/movies/use_cases/get_popular_movies.dart'
    as _i37;
import 'package:moviealike/domain/movies/use_cases/get_upcoming_movies.dart'
    as _i38;
import 'package:moviealike/domain/movies/use_cases/get_youtube_videos.dart'
    as _i41;
import 'package:moviealike/domain/recommendations/repository/recommendations_repository.dart'
    as _i10;
import 'package:moviealike/domain/recommendations/use_cases/get_movie_analysis.dart'
    as _i20;
import 'package:moviealike/domain/recommendations/use_cases/get_movie_recommendations.dart'
    as _i21;
import 'package:moviealike/domain/search/repository/search_repository.dart'
    as _i29;
import 'package:moviealike/domain/search/use_cases/search_movie_by_title.dart'
    as _i44;
import 'package:moviealike/domain/search/use_cases/search_movie_with_filter.dart'
    as _i45;
import 'package:moviealike/domain/series/repository/serie_repository.dart'
    as _i13;
import 'package:moviealike/domain/series/use_cases/get_popular_series.dart'
    as _i22;
import 'package:moviealike/domain/series/use_cases/get_upcoming_series.dart'
    as _i23;
import 'package:moviealike/domain/watchlist/repository/watch_list_repository.dart'
    as _i31;
import 'package:moviealike/domain/watchlist/use_cases/add_to_watch_list.dart'
    as _i33;
import 'package:moviealike/domain/watchlist/use_cases/get_watch_list.dart'
    as _i39;
import 'package:moviealike/domain/watchlist/use_cases/get_watch_list_stream.dart'
    as _i40;
import 'package:moviealike/domain/watchlist/use_cases/is_movie_in_watchlist.dart'
    as _i42;
import 'package:moviealike/domain/watchlist/use_cases/remove_from_watch_list.dart'
    as _i43;
import 'package:moviealike/domain/youtube/repository/youtube_repository.dart'
    as _i18;
import 'package:moviealike/domain/youtube/use_cases/get_youtube_videos_by_title.dart'
    as _i24;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final driftModule = _$DriftModule();
  final networkModule = _$NetworkModule();
  final pathModule = _$PathModule();
  final languageModule = _$LanguageModule();
  await gh.singletonAsync<_i3.AppDatabase>(
    () => driftModule.openConnection(),
    preResolve: true,
  );
  gh.lazySingleton<_i4.AuthorizationInterceptor>(
      () => networkModule.getAuthorizationInterceptor());
  gh.singleton<_i5.DialogService>(() => _i5.DialogService());
  gh.lazySingleton<_i6.Dio>(
      () => networkModule.getDio(gh<_i4.AuthorizationInterceptor>()));
  await gh.singletonAsync<_i7.Directory>(
    () => pathModule.getInternalDocument(),
    instanceName: 'InternalDocuments',
    preResolve: true,
  );
  gh.lazySingleton<_i8.NetworkService>(
      () => networkModule.getNetworkService(gh<_i6.Dio>()));
  gh.factory<_i9.RecommendationsDataSource>(
      () => _i9.RecommendationsDataSource(gh<_i8.NetworkService>()));
  gh.factory<_i10.RecommendationsRepository>(() =>
      _i11.RecommendationsRepositoryImpl(gh<_i9.RecommendationsDataSource>()));
  gh.factory<_i12.SeriesDataSource>(
      () => _i12.SeriesDataSource(gh<_i8.NetworkService>()));
  gh.factory<_i13.SeriesRepository>(
      () => _i14.SeriesRepositoryImpl(gh<_i12.SeriesDataSource>()));
  gh.factory<_i15.UserLanguage>(() => languageModule.getUserLanguage());
  gh.factory<_i16.WatchlistDataSource>(
      () => _i16.WatchlistDataSource(gh<_i3.AppDatabase>()));
  gh.factory<_i17.YoutubeDataSource>(
      () => _i17.YoutubeDataSource(gh<_i8.NetworkService>()));
  gh.factory<_i18.YoutubeRepository>(
      () => _i19.YoutubeRepositoryImpl(gh<_i17.YoutubeDataSource>()));
  gh.factory<_i20.GetMovieAnaysis>(
      () => _i20.GetMovieAnaysis(gh<_i10.RecommendationsRepository>()));
  gh.factory<_i21.GetMovieRecommendations>(
      () => _i21.GetMovieRecommendations(gh<_i10.RecommendationsRepository>()));
  gh.factory<_i22.GetPopularSeries>(
      () => _i22.GetPopularSeries(gh<_i13.SeriesRepository>()));
  gh.factory<_i23.GetUpcomingSeries>(
      () => _i23.GetUpcomingSeries(gh<_i13.SeriesRepository>()));
  gh.factory<_i24.GetYoutubeVideosByTitle>(
      () => _i24.GetYoutubeVideosByTitle(gh<_i18.YoutubeRepository>()));
  gh.factory<_i25.MovieDataSource>(() => _i25.MovieDataSource(
        gh<_i8.NetworkService>(),
        gh<_i15.UserLanguage>(),
      ));
  gh.factory<_i26.MovieRepository>(
      () => _i27.MovieRepositoryImpl(gh<_i25.MovieDataSource>()));
  gh.factory<_i28.SearchDataSource>(() => _i28.SearchDataSource(
        gh<_i8.NetworkService>(),
        gh<_i15.UserLanguage>(),
      ));
  gh.factory<_i29.SearchRepository>(
      () => _i30.SearchRepositoryImpl(gh<_i28.SearchDataSource>()));
  gh.factory<_i31.WatchListRepository>(
      () => _i32.WatchListRepositoryImpl(gh<_i16.WatchlistDataSource>()));
  gh.factory<_i33.AddToWatchList>(
      () => _i33.AddToWatchList(gh<_i31.WatchListRepository>()));
  gh.factory<_i34.GetCastMembers>(
      () => _i34.GetCastMembers(gh<_i26.MovieRepository>()));
  gh.factory<_i35.GetMovieDetails>(
      () => _i35.GetMovieDetails(gh<_i26.MovieRepository>()));
  gh.factory<_i36.GetMoviesWithGenres>(
      () => _i36.GetMoviesWithGenres(gh<_i26.MovieRepository>()));
  gh.factory<_i37.GetPopularMovies>(
      () => _i37.GetPopularMovies(gh<_i26.MovieRepository>()));
  gh.factory<_i38.GetUpcomingMovies>(
      () => _i38.GetUpcomingMovies(gh<_i26.MovieRepository>()));
  gh.factory<_i39.GetWatchList>(
      () => _i39.GetWatchList(gh<_i31.WatchListRepository>()));
  gh.factory<_i40.GetWatchListStream>(
      () => _i40.GetWatchListStream(gh<_i31.WatchListRepository>()));
  gh.factory<_i41.GetYoutubeVideos>(
      () => _i41.GetYoutubeVideos(gh<_i26.MovieRepository>()));
  gh.factory<_i42.IsMovieInWatchList>(
      () => _i42.IsMovieInWatchList(gh<_i31.WatchListRepository>()));
  gh.factory<_i43.RemoveFromWatchList>(
      () => _i43.RemoveFromWatchList(gh<_i31.WatchListRepository>()));
  gh.factory<_i44.SearchMovieByTitle>(
      () => _i44.SearchMovieByTitle(gh<_i29.SearchRepository>()));
  gh.factory<_i45.SearchMovieWithFilter>(
      () => _i45.SearchMovieWithFilter(gh<_i29.SearchRepository>()));
  return getIt;
}

class _$DriftModule extends _i46.DriftModule {}

class _$NetworkModule extends _i47.NetworkModule {}

class _$PathModule extends _i48.PathModule {}

class _$LanguageModule extends _i15.LanguageModule {}
