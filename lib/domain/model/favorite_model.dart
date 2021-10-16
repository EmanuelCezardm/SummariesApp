class FavoriteModel {
  late String _emailUser;
  late int _idSubject;
  late int _idContents;

  FavoriteModel(
    this._emailUser,
    this._idSubject,
    this._idContents,
  );

  String get emailUser => _emailUser;
  int get idSubject => _idSubject;
  int get idContents => _idContents;

  FavoriteModel.fromJson(Map json) {
    _emailUser = json['email_usuario_fk'];
    _idSubject = json['id_materia_fk'];
    _idContents = json['id_assunto_fk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email_usuario_fk'] = _emailUser;
    data['id_materia_fk'] = _idSubject;
    data['id_assunto_fk'] = _idContents;
    return data;
  }
}
