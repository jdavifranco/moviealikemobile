// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerieDto _$SerieDtoFromJson(Map<String, dynamic> json) => SerieDto(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      name: json['name'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    );
