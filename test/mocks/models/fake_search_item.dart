import 'package:faker/faker.dart';
import 'package:moviealike/domain/search/models/search_item.dart';

SearchItem getFakeSearchItem({
  int? id,
  String? title,
  String? name,
  String? overview,
  String? posterPath,
  String? backdropPath,
  String? mediaType,
  List<int>? genreIds,
  double? voteAverage,
  int? voteCount,
  String? originalTitle,
  String? originalName,
  String? originalLanguage,
  String? firstAirDate,
  double? popularity,
  List<String>? originCountry,
  bool? adult,
}) =>
    SearchItem(
      id: id ?? faker.randomGenerator.integer(1000000),
      title: title ?? faker.lorem.sentence(),
      name: name ?? faker.lorem.sentence(),
      overview: overview ?? faker.lorem.sentence(),
    );
