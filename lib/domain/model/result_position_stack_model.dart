import 'dart:convert';

class ResultPositionStackModel {
  late double _latitude;
  late double _longitude;

  ResultPositionStackModel(
    this._latitude,
    this._longitude,
  );

  double get latitude => _latitude;
  double get longitude => _longitude;

  factory ResultPositionStackModel.fromJson(String str) =>
      ResultPositionStackModel.fromMap(json.decode(str));

  ResultPositionStackModel.fromMap(Map json) {
    print(json);
    _latitude = json['data'][0]['latitude'];
    _longitude = json['data'][0]['longitude'];
  }
}
