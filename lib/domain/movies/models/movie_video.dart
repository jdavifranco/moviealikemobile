class MovieVideo {
  final String? iso6391;
  final String? iso31661;
  final String name;
  final String key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String id;

  MovieVideo({
    this.iso6391,
    this.iso31661,
    required this.name,
    required this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    required this.id,
  });
}
