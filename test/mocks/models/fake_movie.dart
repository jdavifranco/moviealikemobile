import 'dart:math';

import 'package:faker/faker.dart';
import 'package:moviealike/domain/movies/models/movie.dart';

Movie getFakeMovie(
        {int? id,
        String? title,
        String? overview,
        String? posterPath,
        String? backdropPath,
        String? releaseDate,
        double? voteAverage,
        int? voteCount}) =>
    Movie(
      id: id ?? faker.randomGenerator.integer(1000000),
      title: title ?? faker.lorem.sentence(),
      overview: overview ?? faker.lorem.sentence(),
      posterPath: posterPath ?? faker.image.loremPicsum(),
      backdropPath: backdropPath ?? faker.image.loremPicsum(),
      releaseDate: releaseDate ?? faker.date.dateTime().toString().split(' ')[0],
      voteAverage: voteAverage ?? Random().nextDouble() * 10.0,
      voteCount: voteCount ?? Random().nextInt(1000),
    );
