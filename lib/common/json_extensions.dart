import 'package:json_annotation/json_annotation.dart';

class JsonStringToInt implements JsonConverter<int, dynamic> {
  const JsonStringToInt();

  @override
  int fromJson(dynamic json) {
    if (json is num) {
      return json.toInt();
    }
    return int.tryParse(json) ?? 0;
  }

  @override
  String toJson(int object) => object.toString();
}

class JsonStringToDouble implements JsonConverter<double, dynamic> {
  const JsonStringToDouble();

  @override
  double fromJson(dynamic json) {
    if (json is num) {
      return json.toDouble();
    }
    return double.tryParse(json) ?? 0;
  }

  @override
  String toJson(double object) => object.toString();
}
