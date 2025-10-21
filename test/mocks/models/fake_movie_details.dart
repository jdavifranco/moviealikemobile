import 'dart:math';

import 'package:faker/faker.dart';
import 'package:moviealike/data/movie/models/genre_dto.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';

MovieDetails getFakeMovieDetails({
  int? id,
  String? title,
  String? overview,
  String? posterPath,
  String? backdropPath,
  String? releaseDate,
  double? voteAverage,
  int? voteCount,
  List<GenreDto>? genres,
}) =>
    MovieDetails(
      id: id ?? faker.randomGenerator.integer(1000000),
      title: title ?? faker.lorem.sentence(),
      overview: overview ?? faker.lorem.sentence(),
      posterPath: posterPath ?? faker.image.loremPicsum(),
      backdropPath: backdropPath ?? faker.image.loremPicsum(),
      releaseDate:
          releaseDate ?? faker.date.dateTime().toString().split(' ')[0],
      voteAverage: voteAverage ?? Random().nextDouble() * 10.0,
      voteCount: voteCount ?? Random().nextInt(1000),
      genres: genres ??
          [
            GenreDto(id: 1, name: 'Action'),
            GenreDto(id: 2, name: 'Drama'),
          ],
    );
