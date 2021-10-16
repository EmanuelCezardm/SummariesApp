class UserModel {
  late String _nameUser;
  late String _cellPhoneUser;
  late String _emailUser;
  late String _passwordUser;
  late bool _isAdminUser;

  UserModel(
    this._nameUser,
    this._cellPhoneUser,
    this._emailUser,
    this._passwordUser,
    this._isAdminUser,
  );

  String get name => _nameUser;
  String get cellPhone => _cellPhoneUser;
  String get email => _emailUser;
  String get password => _passwordUser;
  bool get isAdmin => _isAdminUser;

  UserModel.fromJson(Map json) {
    _nameUser = json['nome_usuario'];
    _cellPhoneUser = json['telefone_usuario'];
    _emailUser = json['email_usuario'];
    _passwordUser = json['senha_usuario'];
    _isAdminUser = json['admin_usuario'] == 1 ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_usuario'] = _nameUser;
    data['telefone_usuario'] = _cellPhoneUser;
    data['email_usuario'] = _emailUser;
    data['senha_usuario'] = _passwordUser;
    data['admin_usuario'] = _isAdminUser == true ? 1 : 0;
    return data;
  }
}
