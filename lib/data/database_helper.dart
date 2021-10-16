import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _db;

  Future<Database> get db async {
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Summaries-App-06.db');
    print(path);

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    return database;
  }

  onCreate(Database db, int version) async {
    String sql =
        'create table usuarios (email_usuario varchar(100) PRIMARY KEY, nome_usuario varchar(100), telefone_usuario varchar(20), senha_usuario varchar(100), admin_usuario boolean);';
    await db.execute(sql);

    sql =
        'create table favoritos (email_usuario_fk varchar(100), id_materia_fk integer, id_assunto_fk integer, FOREIGN KEY (email_usuario_fk) REFERENCES usuarios(email_usuario), FOREIGN KEY (id_materia_fk) REFERENCES materias(id_materia), FOREIGN KEY (id_assunto_fk) REFERENCES assuntos(id_assunto));';
    await db.execute(sql);

    sql =
        'create table materias (id_materia integer PRIMARY KEY, nome_materia varchar(100));';
    await db.execute(sql);

    sql =
        'create table assuntos (id_assunto integer PRIMARY KEY, nome_assunto varchar(100), id_materia_fk integer, FOREIGN KEY (id_materia_fk) REFERENCES materias(id_materia));';
    await db.execute(sql);

    sql =
        "INSERT INTO materias (id_materia ,nome_materia) VALUES (1, 'Biologia');";
    await db.execute(sql);
    sql =
        "INSERT INTO materias (id_materia ,nome_materia) VALUES (2, 'Filosofia');";
    await db.execute(sql);
    sql =
        "INSERT INTO materias (id_materia ,nome_materia) VALUES (3, 'Física');";
    await db.execute(sql);
    sql =
        "INSERT INTO materias (id_materia ,nome_materia) VALUES (4, 'Geografia');";
    await db.execute(sql);
    sql =
        "INSERT INTO materias (id_materia ,nome_materia) VALUES (5, 'História');";
    await db.execute(sql);
    sql =
        "INSERT INTO materias (id_materia ,nome_materia) VALUES (6, 'Português');";
    await db.execute(sql);
    sql =
        "INSERT INTO materias (id_materia ,nome_materia) VALUES (7, 'Química');";
    await db.execute(sql);
    sql =
        "INSERT INTO materias (id_materia ,nome_materia) VALUES (8, 'Sociologia');";
    await db.execute(sql);

    sql =
        "INSERT INTO usuarios (email_usuario, nome_usuario, telefone_usuario, senha_usuario, admin_usuario) VALUES ('SummariesApp@gmail.com', 'Equipe admin', '82940028922', 'summariesapp06', 1);";
    await db.execute(sql);
  }
}
