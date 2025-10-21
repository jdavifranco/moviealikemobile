import 'dart:math';

import 'package:faker/faker.dart';
import 'package:moviealike/domain/watchlist/models/watch_list_movie.dart';

WatchlistMovie getFakeWatchlistMovie({
  int? movieId,
  String? title,
  String? genre,
  double? rating,
  String? releaseYear,
  String? posterUrl,
}) =>
    WatchlistMovie(
      movieId: movieId ?? faker.randomGenerator.integer(1000000),
      title: title ?? faker.lorem.sentence(),
      genre: genre ?? faker.lorem.word(),
      rating: rating ?? Random().nextDouble() * 10.0,
      releaseYear: releaseYear ?? faker.date.dateTime().year.toString(),
      posterUrl: posterUrl ?? faker.image.loremPicsum(),
    );
