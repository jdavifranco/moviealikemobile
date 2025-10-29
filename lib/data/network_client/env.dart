// ignore_for_file: constant_identifier_names, prefer_const_constructors
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'TMDB_BEARER_TOKEN', obfuscate: true)
  static final String tmdbBearerToken = _Env.tmdbBearerToken;

  @EnviedField(varName: 'YOUTUBE_API_KEY', obfuscate: true)
  static final String youtubeApiKey = _Env.youtubeApiKey;
}
