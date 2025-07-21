import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';

class WatchlistMovieDto {
  final int movieId;
  final String title;
  final String genre;
  final double rating;
  final String releaseYear;
  final String posterUrl;

  WatchlistMovieDto({
    required this.movieId,
    required this.title,
    required this.genre,
    required this.rating,
    required this.releaseYear,
    required this.posterUrl,
  });

  WatchlistMovie toDomain() => WatchlistMovie(
        movieId: movieId,
        title: title,
        genre: genre,
        rating: rating,
        releaseYear: releaseYear,
        posterUrl: posterUrl,
      );

  static WatchlistMovieDto fromDomain(WatchlistMovie movie) =>
      WatchlistMovieDto(
        movieId: movie.movieId,
        title: movie.title,
        genre: movie.genre,
        rating: movie.rating,
        releaseYear: movie.releaseYear,
        posterUrl: movie.posterUrl,
      );
}
