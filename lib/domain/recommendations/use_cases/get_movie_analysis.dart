// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/recommendations/models/movie_input_dto.dart';
import 'package:moviealike/domain/recommendations/models/movie_analysis.dart';
import 'package:moviealike/domain/recommendations/repository/recommendations_repository.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetMovieAnaysis {
  final RecommendationsRepository _recommendationsRepository;

  GetMovieAnaysis(
    this._recommendationsRepository,
  );

  Future<Result<MovieAnalysis, RequestError>> call(
          MovieAnalysisInputDto movieInput) =>
      _recommendationsRepository.getMovieAnalysis(movieInput);
}
