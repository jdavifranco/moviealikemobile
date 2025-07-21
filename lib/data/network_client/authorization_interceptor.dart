import 'package:dio/dio.dart';
import 'package:moviealike/data/network_client/api_urls.dart';
import 'package:moviealike/data/network_client/api_config.dart';

class AuthorizationInterceptor extends Interceptor {
  static final String _tmdbBearerToken = "Bearer ${ApiConfig.tmdbBearerToken}";
  static final String _youtubeApiKey = ApiConfig.youtubeApiKey;

  const AuthorizationInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = options.uri.toString();

    if (url.contains(ApiUrls.tmdbBaseUrl)) {
      options.headers['Authorization'] = _tmdbBearerToken;
    }

    if (url.contains(ApiUrls.youtubeBaseUrl)) {
      if (!url.contains('key=')) {
        final separator = options.uri.queryParameters.isEmpty ? '?' : '&';
        options.path += '$separator key=$_youtubeApiKey';
      }
    }

    handler.next(options);
  }
}
