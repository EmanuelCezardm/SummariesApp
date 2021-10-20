import 'package:sqflite/sqflite.dart';
import 'package:summaries_app/data/database_helper.dart';
import 'package:summaries_app/domain/model/user_model.dart';

class UserDao {
  String tableName = 'usuarios';

  Future<List<UserModel>> listUsers() async {
    List<UserModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      UserModel user = UserModel.fromJson(json);
      list.add(user);
    }

    Future.delayed(const Duration(seconds: 5));

    return list;
  }

  Future<List<UserModel>> fetchUserByEmailPassword(
      String email, String senha) async {
    List<UserModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        "SELECT * FROM $tableName WHERE email_usuario = '$email' AND senha_usuario = '$senha';";
    final result = await db.rawQuery(sql);

    print(result);

    for (var json in result) {
      UserModel contents = UserModel.fromJson(json);
      list.add(contents);
    }

    return list;
  }

  Future<List<UserModel>> fetchUserByEmail(String email) async {
    List<UserModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = "SELECT * FROM $tableName WHERE email_usuario = '$email';";
    final result = await db.rawQuery(sql);

    print(result);

    for (var json in result) {
      UserModel contents = UserModel.fromJson(json);
      list.add(contents);
    }

    return list;
  }

  Future addUser(UserModel user) async {
    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        "INSERT INTO $tableName (email_usuario, nome_usuario, telefone_usuario, senha_usuario, admin_usuario) VALUES ('${user.email}', '${user.name}', '${user.cellPhone}', '${user.password}', 0);";
    await db.rawInsert(sql);
  }
}
