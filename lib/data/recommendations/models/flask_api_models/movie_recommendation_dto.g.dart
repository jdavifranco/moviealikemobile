// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_recommendation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRecommendationDto _$MovieRecommendationDtoFromJson(
        Map<String, dynamic> json) =>
    MovieRecommendationDto(
      belongsToCollection: json['belongs_to_collection'] as String?,
      cast: json['cast'] as String?,
      castSize: const JsonStringToInt().fromJson(json['cast_size']),
      crewSize: const JsonStringToInt().fromJson(json['crew_size']),
      director: json['director'] as String?,
      genres: json['genres'] as String?,
      id: const JsonStringToInt().fromJson(json['id']),
      keywords: json['keywords'] as String?,
      originalLanguage: json['original_language'] as String?,
      overview: json['overview'] as String?,
      popularity: const JsonStringToDouble().fromJson(json['popularity']),
      posterPath: json['poster_path'] as String?,
      productionCompanies: json['production_companies'] as String?,
      productionCountries: json['production_countries'] as String?,
      releaseDate: json['release_date'] as String?,
      runtime: const JsonStringToDouble().fromJson(json['runtime']),
      spokenLanguages: json['spoken_languages'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      voteAverage: const JsonStringToDouble().fromJson(json['vote_average']),
      voteCount: const JsonStringToDouble().fromJson(json['vote_count']),
      similarity: const JsonStringToDouble().fromJson(json['similarity']),
      backdropPath: json['backdrop_path'] as String?,
    );
