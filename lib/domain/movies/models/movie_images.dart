import 'package:moviealike/domain/movies/models/movie_image.dart';

class MovieImages {
  final List<MovieImage>? backdrops;
  final List<MovieImage>? logos;
  final List<MovieImage>? posters;
  MovieImages({this.logos, this.backdrops, this.posters});
}
