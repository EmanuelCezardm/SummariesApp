import 'package:sqflite/sqflite.dart';
import 'package:summaries_app/data/database_helper.dart';
import 'package:summaries_app/domain/model/favorite_model.dart';

class FavoriteDao {
  String tableName = 'favoritos';

  Future<List<FavoriteModel>> listFavorites() async {
    List<FavoriteModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      FavoriteModel favorite = FavoriteModel.fromJson(json);
      list.add(favorite);
    }

    Future.delayed(const Duration(seconds: 5));

    return list;
  }

  Future<List<FavoriteModel>> listFavoritesByEmailUser(String emailUser) async {
    List<FavoriteModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        "SELECT * FROM $tableName WHERE email_usuario_fk = '$emailUser'";
    final result = await db.rawQuery(sql);

    for (var json in result) {
      FavoriteModel favorite = FavoriteModel.fromJson(json);
      list.add(favorite);
    }

    Future.delayed(const Duration(seconds: 5));

    return list;
  }

  Future<List<FavoriteModel>> listFavoritesByEmailUserIdSubject(
      String emailUser, int idSubject) async {
    List<FavoriteModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        "SELECT * FROM $tableName WHERE email_usuario_fk = '$emailUser' AND id_materia_fk = $idSubject";
    final result = await db.rawQuery(sql);

    for (var json in result) {
      FavoriteModel favorite = FavoriteModel.fromJson(json);
      list.add(favorite);
    }

    Future.delayed(const Duration(seconds: 5));

    return list;
  }

  Future addFavorite(FavoriteModel favorite) async {
    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        "INSERT INTO $tableName (email_usuario_fk, id_materia_fk, id_assunto_fk) VALUES ('${favorite.emailUser}', ${favorite.idSubject}, ${favorite.idContents});";
    await db.rawInsert(sql);
  }

  Future deleteFavorite(
      String emailUser, int id_materia, int id_assunto) async {
    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        "DELETE FROM $tableName WHERE email_usuario_fk = '$emailUser' AND id_materia_fk = $id_materia AND id_assunto_fk = $id_assunto;";

    await db.rawDelete(sql);
  }
}
