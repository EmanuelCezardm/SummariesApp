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
}
