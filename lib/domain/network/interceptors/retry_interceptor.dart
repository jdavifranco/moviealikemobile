import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';

import '../models/retry_config.dart';

class RetryInterceptor extends Interceptor {
  static const retryEnabledKey = 'retry_enabled';
  static const retryErrorConditionsKey = 'retry_error_conditions';
  RetryInterceptor({
    required this.dio,
    required this.retryConfig,
  });
  final Dio dio;
  final RetryConfig retryConfig;
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final retryCount = err.requestOptions.retryCount + 1;
    if (!err.requestOptions.isRetryEnabled(retryEnabledKey) ||
        !_shouldRetry(err, retryCount, retryConfig)) {
      return handler.next(err);
    }

    err.requestOptions.retryCount = retryCount;
    final delay = _calculateDelay(retryCount);
    print(
        'Retry attempt: $retryCount, Delay: ${delay.inMilliseconds}ms, Error: ${err.message}');
    if (delay != Duration.zero) {
      await Future.delayed(delay);
    }

    try {
      final response = await dio.request(
        err.requestOptions.path,
        options: Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
          extra: err.requestOptions.extra,
        ),
        cancelToken: err.requestOptions.cancelToken,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
      );
      return handler.resolve(response);
    } on DioException catch (e) {
      return super.onError(e, handler);
    } catch (_) {
      return handler.reject(err);
    }
  }

  Duration _calculateDelay(int retryCount) {
    final random = Random();
    final jitter = random.nextDouble() * retryConfig.baseDelayInMiliseconds;
    final delay = retryConfig.baseDelayInMiliseconds * pow(2, retryCount - 1);
    return Duration(milliseconds: (delay + jitter).toInt());
  }

  bool _shouldRetry(
      DioException error, int retryCount, RetryConfig retryConfig) {
    if (retryCount > retryConfig.maxRetries) {
      return false;
    }

    final retryErrorStatusCodes =
        error.requestOptions.getRetryErrorStatusCodes(retryErrorConditionsKey);
    final isRetryableError = error.response != null &&
        retryErrorStatusCodes.contains(error.response?.statusCode);

    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.connectionError ||
        isRetryableError;
  }
}

extension RequestOptionsRetryExtension on RequestOptions {
  bool isRetryEnabled(String key) => (extra[key] as bool?) ?? false;
  List<int> getRetryErrorStatusCodes(String key) {
    final statusCodes = extra[key] as List<int>?;
    return statusCodes ?? [];
  }

  int get retryCount => (extra['retryCount'] as int?) ?? 0;
  set retryCount(int value) => extra['retryCount'] = value;
}
