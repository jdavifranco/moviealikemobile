import 'dart:math';

import 'package:faker/faker.dart';
import 'package:moviealike/domain/search/models/person_details.dart';

PersonDetails getFakePersonDetails(
        {int? id, String? name, int? gender, String? biography}) =>
    PersonDetails(
      id: id ?? faker.randomGenerator.integer(1000000),
      name: name ?? faker.person.name(),
      gender: gender ?? Random().nextInt(3),
      biography: biography ?? faker.lorem.sentence(),
    );
