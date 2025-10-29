import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';
import 'package:moviealike/domain/movies/models/youtube_video.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:moviealike/domain/movies/use_cases/get_cast_members.dart';
import 'package:moviealike/domain/movies/use_cases/get_movie_details.dart';
import 'package:moviealike/domain/movies/use_cases/get_movies_with_genres.dart';
import 'package:moviealike/domain/movies/use_cases/get_youtube_videos.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';
import 'package:moviealike/domain/watchlist/use_cases/add_to_watch_list.dart';
import 'package:moviealike/domain/watchlist/use_cases/is_movie_in_watchlist.dart';
import 'package:moviealike/domain/watchlist/use_cases/remove_from_watch_list.dart';
import 'package:moviealike/domain/youtube/use_cases/get_youtube_videos_by_title.dart';
import 'package:moviealike/presentation/screens/movie_details/movie_details_bloc.dart';
import 'package:moviealike/presentation/screens/movie_details/movie_details_state.dart';
import 'package:result_type/result_type.dart';

import '../../mocks/models/fake_cast_member.dart';
import '../../mocks/models/fake_movie_details.dart';
import '../../mocks/models/fake_movie_recommendation.dart';
import '../../mocks/models/fake_movie_video.dart';
import '../../mocks/models/fake_youtube_video.dart';

class GetMovieDetailsMock extends Mock implements GetMovieDetails {
  static GetMovieDetailsMock dummy({MovieDetails? movieDetails}) {
    final mock = GetMovieDetailsMock();
    when(() => mock.call(any())).thenAnswer(
      (_) async => Success(movieDetails ?? getFakeMovieDetails()),
    );
    return mock;
  }
}

class GetMoviesWithGenresMock extends Mock implements GetMoviesWithGenres {
  static GetMoviesWithGenresMock dummy({List<MovieRecommendation>? recommendations = const []}) {
    final mock = GetMoviesWithGenresMock();
    when(() => mock.call(genreIds: any(named: 'genreIds'), originalMovieId: any(named: 'originalMovieId'))).thenAnswer(
      (_) async => Success(recommendations ?? const []),
    );
    return mock;
  }
}

class AddToWatchListMock extends Mock implements AddToWatchList {
  static AddToWatchListMock dummy() {
    final mock = AddToWatchListMock();
    when(() => mock.call(any())).thenAnswer(
      (_) async => Success(null),
    );
    return mock;
  }
}

class RemoveFromWatchListMock extends Mock implements RemoveFromWatchList {
  static RemoveFromWatchListMock dummy({int movieId = 0}) {
    final mock = RemoveFromWatchListMock();
    when(() => mock.call(movieId)).thenAnswer(
      (_) async => Success(null),
    );
    return mock;
  }
}

class GetCastMembersMock extends Mock implements GetCastMembers {
  static GetCastMembersMock dummy({List<CastMember> castMembers = const []}) {
    final mock = GetCastMembersMock();
    when(() => mock.call(any())).thenAnswer(
      (_) async => Success(castMembers),
    );
    return mock;
  }
}

class GetYoutubeVideosMock extends Mock implements GetYoutubeVideos {
  static GetYoutubeVideosMock dummy({List<MovieVideo> videos = const []}) {
    final mock = GetYoutubeVideosMock();
    when(() => mock.call(any())).thenAnswer(
      (_) async => Success(videos),
    );
    return mock;
  }
}

class GetYoutubeVideosByTitleMock extends Mock implements GetYoutubeVideosByTitle {
  static GetYoutubeVideosByTitleMock dummy({List<YoutubeVideo> videos = const []}) {
    final mock = GetYoutubeVideosByTitleMock();
    when(() => mock.call(any())).thenAnswer(
      (_) async => Success(videos),
    );
    return mock;
  }
}

class IsMovieInWatchListMock extends Mock implements IsMovieInWatchList {
  static IsMovieInWatchListMock dummy({bool isInWatchList = false}) {
    final mock = IsMovieInWatchListMock();
    when(() => mock.call(any())).thenAnswer(
      (_) => Stream.value(isInWatchList),
    );
    return mock;
  }
}

void main() {
  registerFallbackValue(getFakeMovieDetails());
  registerFallbackValue(getFakeCastMember());
  registerFallbackValue(getFakeMovieVideo());
  registerFallbackValue(getFakeYoutubeVideo());
  registerFallbackValue(getFakeMovieRecommendation());
  registerFallbackValue(WatchlistMovie(
    movieId: 1,
    title: 'Fallback Watchlist Movie',
    genre: 'Action',
    rating: 5.0,
    releaseYear: '2023',
    posterUrl: 'fallback-poster.jpg',
  ));

  MovieDetailsBloc getMovieDetailsBloc(
      {GetMovieDetails? getMovieDetails,
      GetMoviesWithGenres? getMoviesWithGenres,
      AddToWatchList? addToWatchList,
      RemoveFromWatchList? removeFromWatchList,
      GetCastMembers? getCastMembers,
      GetYoutubeVideos? getYoutubeVideos,
      GetYoutubeVideosByTitle? getYoutubeVideosByTitle,
      IsMovieInWatchList? isMovieInWatchList,
      int selectedMovieId = 0}) {
    return MovieDetailsBloc(
      getYoutubeVideosByTitle ?? GetYoutubeVideosByTitleMock.dummy(),
      getMovieDetails ?? GetMovieDetailsMock.dummy(),
      getMoviesWithGenres ?? GetMoviesWithGenresMock.dummy(),
      getCastMembers ?? GetCastMembersMock.dummy(),
      getYoutubeVideos ?? GetYoutubeVideosMock.dummy(),
      addToWatchList ?? AddToWatchListMock.dummy(),
      isMovieInWatchList ?? IsMovieInWatchListMock.dummy(),
      removeFromWatchList ?? RemoveFromWatchListMock.dummy(),
      selectedMovieId,
    );
  }

  group('MovieDetailsBloc', () {
    group('init', () {
      group('when getMovieDetails is successful', () {
        final movieDetails = getFakeMovieDetails(
          id: 123,
          title: 'Test Movie',
          overview: 'Test Overview',
        );
        final getMovieDetailsMock = GetMovieDetailsMock.dummy(movieDetails: movieDetails);
        final getMoviesWithGenresMock = GetMoviesWithGenresMock.dummy(
            recommendations: [getFakeMovieRecommendation(), getFakeMovieRecommendation()]);
        final mockGetCastMembers = GetCastMembersMock.dummy(castMembers: [getFakeCastMember(), getFakeCastMember()]);
        final mockGetYoutubeVideos = GetYoutubeVideosMock.dummy(videos: [getFakeMovieVideo(), getFakeMovieVideo()]);
        final mockGetYoutubeVideosByTitle =
            GetYoutubeVideosByTitleMock.dummy(videos: [getFakeYoutubeVideo(), getFakeYoutubeVideo()]);
        final mockIsMovieInWatchList = IsMovieInWatchListMock.dummy(isInWatchList: false);

        final movieDetailsBloc = getMovieDetailsBloc(
          getMovieDetails: getMovieDetailsMock,
          getMoviesWithGenres: getMoviesWithGenresMock,
          getCastMembers: mockGetCastMembers,
          getYoutubeVideos: mockGetYoutubeVideos,
          getYoutubeVideosByTitle: mockGetYoutubeVideosByTitle,
          isMovieInWatchList: mockIsMovieInWatchList,
          selectedMovieId: 123,
        );

        blocTest<MovieDetailsBloc, MovieDetailsState>(
          'emits correct state when getMovieDetails returns success and the additional data is loaded',
          build: () => movieDetailsBloc,
          act: (bloc) => bloc.init(),
          expect: () => [
            isA<MovieDetailsState>().having((state) => state.isLoading, 'isLoading', isTrue),
            isA<MovieDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.selectedMovieDetails, 'selectedMovieDetails', isNotNull)
                .having((state) => state.selectedMovieDetails?.title, 'movie title', 'Test Movie'),
            isA<MovieDetailsState>()
                .having((state) => state.castMembers.length, 'castMembers', 2)
                .having((state) => state.videos.length, 'videos', 2)
                .having((state) => state.youtubeVideos.length, 'youtubeVideos', 2)
          ],
        );
      });

      group('when getMovieDetails fails', () {
        final getMovieDetailsMock = GetMovieDetailsMock();
        final error = ServerError(statusCode: 500);

        when(() => getMovieDetailsMock(123)).thenAnswer(
          (_) async => Failure(error),
        );

        final movieDetailsBloc = getMovieDetailsBloc(
          getMovieDetails: getMovieDetailsMock,
          selectedMovieId: 123,
        );

        blocTest<MovieDetailsBloc, MovieDetailsState>(
          'emits error state when getMovieDetails fails',
          build: () => movieDetailsBloc,
          act: (bloc) => bloc.init(),
          verify: (bloc) {
            verify(() => getMovieDetailsMock(123)).called(1);
          },
          expect: () => [
            isA<MovieDetailsState>().having((state) => state.isLoading, 'isLoading', isTrue),
            isA<MovieDetailsState>()
                .having((state) => state.isLoading, 'isLoading', isFalse)
                .having((state) => state.error, 'error', isA<ServerError>()),
          ],
        );
      });
    });

    group('setYoutubeId', () {
      final movieDetailsBloc = getMovieDetailsBloc(selectedMovieId: 123);

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'emits state with updated youtubeId',
        build: () => movieDetailsBloc,
        act: (bloc) => bloc.setYoutubeId('test-youtube-id'),
        expect: () => [
          isA<MovieDetailsState>().having((state) => state.youtubeId, 'youtubeId', 'test-youtube-id'),
        ],
      );
    });
  });
}
