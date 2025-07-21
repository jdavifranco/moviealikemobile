import 'package:collection/collection.dart';

enum SearchFilter {
  crew(name: "with_crew"),
  cast(name: "with_cast"),
  people(name: "with_people"),
  keywords(name: "with_keywords"),
  genres(name: "with_genres"),
  country(name: "with_origin_country"),
  companies(name: "with_companies");

  final String name;

  const SearchFilter({required this.name});

  static SearchFilter? getFilterFromName(String name) {
    return SearchFilter.values
        .firstWhereOrNull((element) => element.name == name);
  }
}
