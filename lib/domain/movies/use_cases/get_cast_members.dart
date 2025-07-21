// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/movies/models/cast_member.dart';
import 'package:moviealike/domain/movies/repository/movie_repository.dart';
import 'package:result_type/result_type.dart';

@injectable
class GetCastMembers {
  final MovieRepository _movieRepository;

  GetCastMembers(
    this._movieRepository,
  );

  Future<Result<List<CastMember>, RequestError>> call(int movieId) =>
      _movieRepository.getCastCrewMembers(movieId);
}
