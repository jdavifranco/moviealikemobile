enum SearchType {
  movie("movie", "Movies"),
  series("tv", "Series");

  final String apiType;
  final String name;
  const SearchType(this.apiType, this.name);
}
