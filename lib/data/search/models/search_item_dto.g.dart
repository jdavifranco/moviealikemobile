// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemDto _$SearchItemDtoFromJson(Map<String, dynamic> json) =>
    SearchItemDto(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      mediaType: json['media_type'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      firstAirDate: json['first_air_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      releaseDate: json['release_date'] as String?,
    );
