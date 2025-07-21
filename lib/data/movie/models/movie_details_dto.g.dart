// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsDto _$MovieDetailsDtoFromJson(Map<String, dynamic> json) =>
    MovieDetailsDto(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection: json['belongs_to_collection'],
      budget: (json['budget'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: (json['id'] as num).toInt(),
      imdbId: json['imdb_id'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompanyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      revenue: (json['revenue'] as num?)?.toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    );
