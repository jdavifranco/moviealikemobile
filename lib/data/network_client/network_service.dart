import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:result_type/result_type.dart';

class NetworkService {
  final Dio _dio;

  NetworkService(this._dio);

  Future<Result<T, RequestError>> request<T>({
    required String path,
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options?.copyWith(method: method, headers: headers) ??
            Options(method: method, headers: headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Success(response.data as T);
    } on DioException catch (error) {
      if (error.requestOptions.cancelToken?.isCancelled ?? false) {
        return Failure(RequestCancelled());
      }
      if (error.error is SocketException) {
        return Failure(ConnectionError());
      }
      Map<String, dynamic>? errorData;
      if (error.response?.data is Map<String, dynamic>) {
        errorData = error.response?.data;
      }
      return Failure(ServerError(
        statusCode: error.response?.statusCode,
        data: errorData,
      ));
    } catch (error) {
      return Failure(ServerError());
    }
  }

  Future<Result<Map<String, dynamic>, RequestError>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return request<Map<String, dynamic>>(
      path: path,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
      cancelToken: cancelToken,
    );
  }

  Future<Result<Map<String, dynamic>, RequestError>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) {
    return request<Map<String, dynamic>>(
      path: path,
      method: 'POST',
      data: data,
      queryParameters: queryParameters,
      headers: headers,
      cancelToken: cancelToken,
    );
  }
}
