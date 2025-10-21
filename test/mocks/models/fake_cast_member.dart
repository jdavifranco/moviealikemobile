import 'dart:math';

import 'package:faker/faker.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';

CastMember getFakeCastMember({
  int? id,
  String? name,
  String? character,
  String? profilePath,
  int? order,
  bool? adult,
  int? gender,
  String? knownForDepartment,
  String? originalName,
  double? popularity,
  int? castId,
  String? creditId,
  String? job,
}) =>
    CastMember(
      id: id ?? faker.randomGenerator.integer(1000000),
      name: name ?? faker.person.name(),
      character: character ?? faker.lorem.word(),
      profilePath: profilePath ?? faker.image.loremPicsum(),
      order: order ?? Random().nextInt(10),
      adult: adult ?? false,
      gender: gender ?? Random().nextInt(3),
      knownForDepartment: knownForDepartment ?? 'Acting',
      originalName: originalName ?? faker.person.name(),
      popularity: popularity ?? Random().nextDouble() * 100.0,
      castId: castId ?? Random().nextInt(1000),
      creditId: creditId ?? faker.randomGenerator.string(20),
      job: job,
    );
