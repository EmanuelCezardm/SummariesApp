import 'dart:convert';

class ResultCepModel {
  late String _cep;
  late String _logradouro;
  late String _bairro;
  late String _localidade;
  late String _uf;
  late bool _erro;

  ResultCepModel(
    this._cep,
    this._logradouro,
    this._bairro,
    this._localidade,
    this._uf,
    this._erro,
  );

  String get cep => _cep;
  String get logradouro => _logradouro;
  String get bairro => _bairro;
  String get localidade => _localidade;
  String get uf => _uf;
  bool get erro => _erro;

  factory ResultCepModel.fromJson(String str) =>
      ResultCepModel.fromMap(json.decode(str));

  ResultCepModel.fromMap(Map json) {
    _cep = json['cep'] ?? '';
    _logradouro = json['logradouro'] ?? '';
    _bairro = json['bairro'] ?? '';
    _localidade = json['localidade'] ?? '';
    _uf = json['uf'] ?? '';
    _erro = json['erro'] ?? false;
  }
}
