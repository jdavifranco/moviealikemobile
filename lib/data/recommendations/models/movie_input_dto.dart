import 'package:json_annotation/json_annotation.dart';
import 'package:moviealike/domain/movies/models/movie_details.dart';
part 'movie_input_dto.g.dart';

@JsonSerializable()
class MovieAnalysisInputDto {
  final String title;
  final List<String> genres;
  final int? yearOfRelease;
  final double rating;
  final String overview;
  final int numberOfRecommendations;

  MovieAnalysisInputDto({
    required this.title,
    required this.genres,
    required this.yearOfRelease,
    required this.rating,
    required this.overview,
    this.numberOfRecommendations = 4,
  });

  factory MovieAnalysisInputDto.fromDomain(MovieDetails movieDetails) =>
      MovieAnalysisInputDto(
        title: movieDetails.title,
        genres: movieDetails.genres?.map((e) => e.name).toList() ?? [],
        yearOfRelease:
            int.tryParse(movieDetails.releaseDate?.split("-").first ?? ""),
        rating: movieDetails.voteAverage ?? 6.0,
        overview: movieDetails.overview,
      );
}
