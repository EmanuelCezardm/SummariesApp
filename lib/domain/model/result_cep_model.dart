import 'dart:convert';

class ResultCepModel {
  late String _cep;
  late String _logradouro;
  late String _bairro;
  late String _localidade;
  late String _uf;

  ResultCepModel(
    this._cep,
    this._logradouro,
    this._bairro,
    this._localidade,
    this._uf,
  );

  String get cep => _cep;
  String get logradouro => _logradouro;
  String get bairro => _bairro;
  String get localidade => _localidade;
  String get uf => _uf;

  factory ResultCepModel.fromJson(String str) =>
      ResultCepModel.fromMap(json.decode(str));

  ResultCepModel.fromMap(Map json) {
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
    _uf = json['uf'];
  }
}
