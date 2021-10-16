import 'package:sqflite/sqflite.dart';
import 'package:summaries_app/data/database_helper.dart';
import 'package:summaries_app/domain/model/contents_model.dart';

class ContentsDao {
  String tableName = 'favoritos';

  Future<List<ContentsModel>> listContents() async {
    List<ContentsModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      ContentsModel contents = ContentsModel.fromJson(json);
      list.add(contents);
    }

    return list;
  }
}
