import 'package:sqflite/sqflite.dart';
import 'package:summaries_app/data/database_helper.dart';
import 'package:summaries_app/domain/model/subjects_model.dart';

class SubjectsDao {
  String tableName = 'materias';

  Future<List<SubjectsModel>> listSubjects() async {
    List<SubjectsModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      SubjectsModel subject = SubjectsModel.fromJson(json);
      list.add(subject);
    }

    return list;
  }
}
