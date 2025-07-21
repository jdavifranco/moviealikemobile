import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';
import 'package:moviealike/domain/movies/models/youtube_video.dart';
import 'package:moviealike/domain/recommendations/models/movie_analysis.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';

part 'movie_details_state.g.dart';

@CopyWith()
class MovieDetailsState {
  final MovieDetails? selectedMovieDetails;
  final List<CastMember> castMembers;
  final MovieAnalysis? selectedMovieAnalaysis;
  final List<MovieRecommendation> modelRecommendations;
  final List<MovieRecommendation> genreRecommendations;
  final List<MovieVideo> videos;
  final List<YoutubeVideo> youtubeVideos;
  final String youtubeId;
  final bool isLoading;
  final bool isFavorite;
  final bool isLoadingCast;
  final bool hasError;
  final RequestError? error;

  const MovieDetailsState({
    this.selectedMovieAnalaysis,
    this.selectedMovieDetails,
    this.isLoading = false,
    this.modelRecommendations = const [],
    this.castMembers = const [],
    this.youtubeId = "",
    this.videos = const [],
    this.isFavorite = false,
    this.hasError = false,
    this.genreRecommendations = const [],
    this.isLoadingCast = false,
    this.youtubeVideos = const [],
    this.error,
  });
}
