import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:moviealike/data/network_client/api_urls.dart';
import 'package:moviealike/data/network_client/authorization_interceptor.dart';
import 'package:moviealike/data/network_client/network_service.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  AuthorizationInterceptor getAuthorizationInterceptor() {
    return const AuthorizationInterceptor();
  }

  @lazySingleton
  Dio getDio(AuthorizationInterceptor authorizationInterceptor) {
    final dio = Dio(BaseOptions(
      baseUrl: ApiUrls.tmdbBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ));

    dio.interceptors.addAll([
      authorizationInterceptor,
    ]);

    return dio;
  }

  @lazySingleton
  NetworkService getNetworkService(Dio dio) {
    return NetworkService(dio);
  }
}
