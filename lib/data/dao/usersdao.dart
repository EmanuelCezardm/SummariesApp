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

    return list;
  }

  Future createUser(UserModel user) async {}
}
