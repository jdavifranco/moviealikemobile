import 'dart:math';

import 'package:faker/faker.dart';
import 'package:moviealike/domain/movies/models/movie_video.dart';

MovieVideo getFakeMovieVideo({
  String? id,
  String? key,
  String? name,
  String? site,
  String? type,
  bool? official,
}) =>
    MovieVideo(
      id: id ?? faker.randomGenerator.string(10),
      key: key ?? faker.randomGenerator.string(10),
      name: name ?? faker.lorem.sentence(),
      site: site ?? 'YouTube',
      type: type ?? 'Trailer',
      official: official ?? Random().nextBool(),
    );
