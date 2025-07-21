sealed class RequestError implements Exception {}

class ServerError implements RequestError {
  final int? statusCode;
  final Map<String, dynamic>? data;
  ServerError({this.statusCode, this.data});
}

class ConnectionError implements RequestError {}

class RequestCancelled implements RequestError {}

class NoResultsFound implements RequestError {}
