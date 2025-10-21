import 'dart:math';

import 'package:faker/faker.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';

MovieRecommendation getFakeMovieRecommendation({
  int? id,
  String? title,
  String? overview,
  double? similarity,
}) =>
    MovieRecommendation(
      id: id ?? faker.randomGenerator.integer(1000000),
      title: title ?? faker.lorem.sentence(),
      overview: overview ?? faker.lorem.sentence(),
      similarity: similarity ?? Random().nextDouble(),
    );
