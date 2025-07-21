import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/network_client/result_extensions.dart';
import 'package:result_type/result_type.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';
import 'package:moviealike/domain/movies/models/youtube_video.dart';
import 'package:moviealike/domain/movies/use_cases/get_cast_members.dart';
import 'package:moviealike/domain/movies/use_cases/get_movie_details.dart';
import 'package:moviealike/domain/movies/use_cases/get_movies_with_genres.dart';
import 'package:moviealike/domain/movies/use_cases/get_youtube_videos.dart';
import 'package:moviealike/domain/youtube/use_cases/get_youtube_videos_by_title.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';
import 'package:moviealike/domain/watchlist/use_cases/add_to_watch_list.dart';
import 'package:moviealike/domain/watchlist/use_cases/is_movie_in_watchlist.dart';
import 'package:moviealike/domain/watchlist/use_cases/remove_from_watch_list.dart';
import 'package:moviealike/presentation/screens/movie_details/movie_details_state.dart';

class MovieDetailsBloc extends Cubit<MovieDetailsState> {
  final GetMovieDetails _getMovieDetails;
  final GetMoviesWithGenres _getMoviesWithGenres;
  final AddToWatchList _addToWatchList;
  final RemoveFromWatchList _removeFromWatchList;
  final GetCastMembers _getCastMembers;
  final GetYoutubeVideos _getYoutubeVideos;
  final GetYoutubeVideosByTitle _getYoutubeVideosByTitle;
  final IsMovieInWatchList _isMovieInWatchList;
  final int selectedMovieId;

  MovieDetailsBloc(
    this._getYoutubeVideosByTitle,
    this._getMovieDetails,
    this._getMoviesWithGenres,
    this._getCastMembers,
    this._getYoutubeVideos,
    this._addToWatchList,
    this._isMovieInWatchList,
    this._removeFromWatchList,
    this.selectedMovieId,
  ) : super(const MovieDetailsState());

  StreamSubscription? favoriteSubscription;

  void init() async {
    emit(state.copyWith(isLoading: true, hasError: false, error: null));

    final movieDetailsResult = await _getMovieDetails(selectedMovieId);

    movieDetailsResult.when(
      success: (selectedMovieDetails) async {
        favoriteSubscription =
            _isMovieInWatchList(selectedMovieDetails.id).listen((isIn) {
          emit(state.copyWith(isFavorite: isIn));
        });

        emit(state.copyWith(
          selectedMovieDetails: selectedMovieDetails,
          isLoading: false,
        ));

        _loadAdditionalData(selectedMovieDetails);
        _loadGenreRecommendations(selectedMovieDetails);
      },
      failure: (error) {
        emit(state.copyWith(
          isLoading: false,
          hasError: true,
          error: error,
        ));
      },
    );
  }

  Future<void> _loadGenreRecommendations(
      MovieDetails selectedMovieDetails) async {
    final genreRecommendations = (await _getMoviesWithGenres(
      genreIds: selectedMovieDetails.genres?.map((e) => e.id).toList() ?? [],
      originalMovieId: selectedMovieDetails.id,
    ))
        .unwrapOr([]);

    final validRecommendations = genreRecommendations
        .where((element) =>
            element.id != selectedMovieDetails.id &&
            element.backdropPath != null &&
            element.posterPath != null &&
            !element.similarity.isNaN &&
            element.similarity > 0)
        .toList();
    emit(state.copyWith(
      isLoading: false,
      modelRecommendations: validRecommendations,
    ));
  }

  Future<void> _loadAdditionalData(MovieDetails selectedMovieDetails) async {
    final movieDetailsResult = await Future.wait([
      _getYoutubeVideosByTitle(selectedMovieDetails.originalTitle ?? ""),
      _getYoutubeVideos(selectedMovieDetails.id),
      _getCastMembers(selectedMovieDetails.id),
    ]);

    final youtubeVideosByTitleResult =
        movieDetailsResult[0] as Result<List<YoutubeVideo>, RequestError>;
    final youtubeVideosResult =
        movieDetailsResult[1] as Result<List<MovieVideo>, RequestError>;
    final castMembersResult =
        movieDetailsResult[2] as Result<List<CastMember>, RequestError>;

    final youtubeVideosByTitle =
        youtubeVideosByTitleResult.unwrapOr(<YoutubeVideo>[]);

    final youtubeVideos = youtubeVideosResult.unwrapOr(<MovieVideo>[]);

    final castMembers = castMembersResult.unwrapOr(<CastMember>[]);

    emit(state.copyWith(
      isLoading: false,
      castMembers: castMembers,
      videos: youtubeVideos,
      youtubeVideos: youtubeVideosByTitle,
    ));
  }

  Future<void> addToWatchList() async {
    if (state.isFavorite) {
      _removeFromWatchList(state.selectedMovieDetails!.id);
    } else {
      _addToWatchList(WatchlistMovie(
        movieId: state.selectedMovieDetails!.id,
        title: state.selectedMovieDetails!.title,
        genre: state.selectedMovieDetails!.genres!
            .map((e) => e.name)
            .toList()
            .first,
        rating: state.selectedMovieDetails?.voteAverage ?? 0,
        releaseYear: state.selectedMovieDetails?.releaseDate ?? "",
        posterUrl: state.selectedMovieDetails?.posterPath ?? "",
      ));
    }
  }

  void setYoutubeId(String youtubeId) {
    emit(state.copyWith(youtubeId: youtubeId));
  }

  @override
  Future<void> close() {
    favoriteSubscription?.cancel();
    return super.close();
  }
}
