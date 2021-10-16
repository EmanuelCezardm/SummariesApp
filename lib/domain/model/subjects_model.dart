class SubjectsModel {
  late String _nameSubjects;
  late int _idSubject;

  SubjectsModel(
    this._nameSubjects,
    this._idSubject,
  );

  String get nameSubjects => _nameSubjects;
  int get idSubject => _idSubject;

  SubjectsModel.fromJson(Map json) {
    _nameSubjects = json['nome_materia'];
    _idSubject = json['id_materia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_materia'] = _nameSubjects;
    data['id_materia'] = _idSubject;
    return data;
  }
}
