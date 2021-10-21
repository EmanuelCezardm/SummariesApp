import 'package:sqflite/sqflite.dart';
import 'package:summaries_app/data/database_helper.dart';
import 'package:summaries_app/domain/model/contents_model.dart';

class ContentsDao {
  String tableName = 'assuntos';

  Future<List<ContentsModel>> listContents() async {
    List<ContentsModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName;';
    final result = await db.rawQuery(sql);

    print(result);

    for (var json in result) {
      ContentsModel contents = ContentsModel.fromJson(json);
      list.add(contents);
    }

    Future.delayed(const Duration(seconds: 5));

    return list;
  }

  Future<List<ContentsModel>> listContentsBySubjectsId(int id_subject) async {
    List<ContentsModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = 'SELECT * FROM $tableName WHERE id_materia_fk = $id_subject;';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      ContentsModel contents = ContentsModel.fromJson(json);
      list.add(contents);
    }

    Future.delayed(const Duration(seconds: 5));

    return list;
  }

  Future<List<ContentsModel>> fetchContentsByName(String name) async {
    List<ContentsModel> list = [];

    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql = "SELECT * FROM $tableName WHERE nome_assunto = '$name';";
    final result = await db.rawQuery(sql);

    for (var json in result) {
      ContentsModel contents = ContentsModel.fromJson(json);
      list.add(contents);
    }

    return list;
  }

  Future addContent(ContentsModel content) async {
    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        "INSERT INTO $tableName (nome_assunto, id_materia_fk) VALUES ('${content.nameContents}', ${content.idSubject});";
    await db.rawInsert(sql);
  }

  Future deleteContent(int id_assunto, int id_materia) async {
    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        'DELETE FROM $tableName WHERE id_assunto = $id_assunto AND id_materia_fk = $id_materia;';

    await db.rawDelete(sql);
  }

  Future updateName(String nome_assunto, int id_assunto, int id_materia) async {
    DatabaseHelper database = DatabaseHelper();
    Database db = await database.db;

    String sql =
        "UPDATE $tableName SET nome_assunto = '$nome_assunto' WHERE id_assunto = $id_assunto AND id_materia_fk = $id_materia;";
    await db.rawUpdate(sql);
  }
}
