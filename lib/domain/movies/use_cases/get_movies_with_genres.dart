// coverage:ignore-file
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/movie_keyword.dart';
import 'package:moviealike/domain/movies/repository/movie_repository.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetMoviesWithGenres {
  final MovieRepository _movieRepository;

  GetMoviesWithGenres(
    this._movieRepository,
  );

  Future<Result<List<MovieRecommendation>, RequestError>> call(
      {required List<int> genreIds, required int originalMovieId}) async {
    final originalMovieKeywordsResult =
        await _movieRepository.getMovieKeywords(originalMovieId);

    if (originalMovieKeywordsResult.isFailure) {
      return Failure(originalMovieKeywordsResult.failure);
    }

    final originalMovieKeywords = originalMovieKeywordsResult.success;

    final moviesResult = await _movieRepository.getMoviesWithKeywords(
        originalMovieKeywords.map((e) => e.id).toList(), genreIds);

    if (moviesResult.isFailure) {
      return Failure(moviesResult.failure);
    }

    final movies = moviesResult.success;

    // Process each movie to create recommendations
    final recommendations = <MovieRecommendation>[];

    for (final movie in movies) {
      final recommendationGenreIds = movie.genreIds;
      final genreSimilarity =
          calculateGenreSimilarity(recommendationGenreIds!, genreIds);

      // Get keywords for this movie
      final keywordsResult = await _movieRepository.getMovieKeywords(movie.id);

      if (keywordsResult.isSuccess) {
        final keywords = keywordsResult.success;
        final textSimilarity =
            calculateKeywordsSimilarity(keywords, originalMovieKeywords);
        final transformedGenreSimilarity = genreSimilarity * 0.66;
        final transformedTextSimilarity = textSimilarity * 0.23;
        final randomVariation = 0.1 * Random().nextDouble();
        final combinedSimilarity = transformedGenreSimilarity +
            transformedTextSimilarity +
            randomVariation;
        recommendations.add(movie.toMovieRecommendation(combinedSimilarity));
      }
    }

    return Success(
        recommendations.sorted((a, b) => b.similarity.compareTo(a.similarity)));
  }

  double calculateGenreSimilarity(List<int> genresA, List<int> genresB) {
    final setA = genresA.toSet();
    final setB = genresB.toSet();
    print("Genre ids");
    print(setA);
    print(setB);
    final intersection = setA.intersection(setB).length;
    final union = setA.union(setB).length;
    final jaccardSimilarity = (intersection / union);

    // Weighting factor based on the size of the genre lists
    final sizeFactor =
        min(setA.length, setB.length) / max(setA.length, setB.length);
    return jaccardSimilarity * sizeFactor;
  }

  double calculateKeywordsSimilarity(
      List<MovieKeyword> keywordsA, List<MovieKeyword> keywordsB) {
    final setA = keywordsA.map((e) => e.id).toSet();
    final setB = keywordsB.map((e) => e.id).toSet();
    print("keywords ids");
    print(setA);
    print(setB);
    final intersection = setA.intersection(setB).length;
    final union = setA.union(setB).length;
    final jaccardSimilarity = (intersection / union);

    // Weighting factor based on the size of the keyword lists
    final sizeFactor =
        min(setA.length, setB.length) / max(setA.length, setB.length);
    return jaccardSimilarity * sizeFactor;
  }
}
