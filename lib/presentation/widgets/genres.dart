import 'package:collection/collection.dart';

enum Genre {
  action(28, 'Action'),
  adventure(12, 'Adventure'),
  animation(16, 'Animation'),
  comedy(35, 'Comedy'),
  crime(80, 'Crime'),
  documentary(99, 'Documentary'),
  drama(18, 'Drama'),
  family(10751, 'Family'),
  fantasy(14, 'Fantasy'),
  history(36, 'History'),
  horror(27, 'Horror'),
  music(10402, 'Music'),
  mystery(9648, 'Mystery'),
  romance(10749, 'Romance'),
  scienceFiction(878, 'Science Fiction'),
  tvMovie(10770, 'TV Movie'),
  thriller(53, 'Thriller'),
  war(10752, 'War'),
  western(37, 'Western');

  // Properties
  final int id;
  final String name;

  // Constructor
  const Genre(this.id, this.name);

  static Genre? getById(int id) {
    return Genre.values.firstWhereOrNull((genre) => genre.id == id);
  }

  static Genre? getByName(String name) {
    return Genre.values.firstWhereOrNull((genre) => genre.name == name);
  }
}
