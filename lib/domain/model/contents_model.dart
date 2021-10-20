class ContentsModel {
  late int _idContents;
  late String _nameContents;
  late int _idSubject;

  ContentsModel(
    this._nameContents,
    this._idSubject,
  );

  int get idContents => _idContents;
  String get nameContents => _nameContents;
  int get idSubject => _idSubject;

  ContentsModel.fromJson(Map json) {
    _idContents = json['id_assunto'];
    _nameContents = json['nome_assunto'];
    _idSubject = json['id_materia_fk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_assunto'] = _nameContents;
    data['id_materia_fk'] = _idSubject;
    return data;
  }
}
