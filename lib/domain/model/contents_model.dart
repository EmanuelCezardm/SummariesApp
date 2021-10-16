class ContentsModel {
  late String _nameContents;
  late int _idContents;
  late int _idSubject;

  ContentsModel(
    this._nameContents,
    this._idContents,
    this._idSubject,
  );

  String get nameContents => _nameContents;
  int get idContents => _idContents;
  int get idSubject => _idSubject;

  ContentsModel.fromJson(Map json) {
    _nameContents = json['nome_assunto'];
    _idContents = json['id_assunto'];
    _idSubject = json['id_materia_fk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_assunto'] = _nameContents;
    data['id_assunto'] = _idContents;
    data['id_materia_fk'] = _idSubject;
    return data;
  }
}
