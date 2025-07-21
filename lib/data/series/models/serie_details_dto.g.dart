// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerieDetailsDto _$SerieDetailsDtoFromJson(Map<String, dynamic> json) =>
    SerieDetailsDto(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      createdBy: (json['created_by'] as List<dynamic>)
          .map((e) => CreatorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeRunTime: (json['episode_run_time'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      firstAirDate: json['first_air_date'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: (json['id'] as num).toInt(),
      inProduction: json['in_production'] as bool,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      lastAirDate: json['last_air_date'] as String,
      lastEpisodeToAir: EpisodeDto.fromJson(
          json['last_episode_to_air'] as Map<String, dynamic>),
      name: json['name'] as String,
      nextEpisodeToAir: EpisodeDto.fromJson(
          json['next_episode_to_air'] as Map<String, dynamic>),
      networks: (json['networks'] as List<dynamic>)
          .map((e) => NetworkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: (json['number_of_episodes'] as num).toInt(),
      numberOfSeasons: (json['number_of_seasons'] as num).toInt(),
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String,
      originalName: json['original_name'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompanyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => SeasonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => LanguageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      type: json['type'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
    );
