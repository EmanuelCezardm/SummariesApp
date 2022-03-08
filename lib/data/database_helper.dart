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
    String path = join(databasePath, 'Summaries-App-atualizado.db');
    print(path);

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    return database;
  }

  onCreate(Database db, int version) async {
    /****************************************************************
    *****************************************************************
    **************************CREATE TABLES**************************
    *****************************************************************
    ****************************************************************/

    String sql =
        'create table usuarios (email_usuario varchar(100) PRIMARY KEY, nome_usuario varchar(100), telefone_usuario varchar(20), senha_usuario varchar(100), admin_usuario boolean, cep_usuario varchar(9));';
    await db.execute(sql);

    sql =
        'create table favoritos (email_usuario_fk varchar(100), id_materia_fk integer, id_assunto_fk integer, FOREIGN KEY (email_usuario_fk) REFERENCES usuarios(email_usuario), FOREIGN KEY (id_materia_fk) REFERENCES materias(id_materia), FOREIGN KEY (id_assunto_fk) REFERENCES assuntos(id_assunto));';
    await db.execute(sql);

    sql =
        'create table materias (id_materia integer PRIMARY KEY, nome_materia varchar(100));';
    await db.execute(sql);

    sql =
        'create table assuntos (id_assunto integer PRIMARY KEY AUTOINCREMENT, nome_assunto varchar(100), id_materia_fk integer, FOREIGN KEY (id_materia_fk) REFERENCES materias(id_materia));';
    await db.execute(sql);

    /****************************************************************
    *****************************************************************
    ************************INSERT DE SUBJECTS***********************
    *****************************************************************
    ****************************************************************/

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

    /****************************************************************
    *****************************************************************
    *************************INSERT DE USERS*************************
    *****************************************************************
    ****************************************************************/

    sql =
        "INSERT INTO usuarios (email_usuario, nome_usuario, telefone_usuario, senha_usuario, admin_usuario) VALUES ('SummariesApp@gmail.com', 'Equipe admin', '(82) 9 4002-8922', 'summariesapp06', 1, '57312-020');";
    await db.execute(sql);
    sql =
        "INSERT INTO usuarios (email_usuario, nome_usuario, telefone_usuario, senha_usuario, admin_usuario) VALUES ('teste@gmail.com', 'teste', '(82) 9 9999-9999', '12345678', 0, '57312-020');";
    await db.execute(sql);

    /****************************************************************
    ************************INSERT DE CONTENT************************
    *****************************************************************
    ****************************BIOLOGIA*****************************
    ****************************************************************/

    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Conceitos Básicos', 1);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Biomas', 1);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Relações Ecológicas', 1);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Cadeia Alimentar', 1);";
    await db.execute(sql);

    /****************************************************************
    ************************INSERT DE CONTENT************************
    *****************************************************************
    ****************************FILOSOFIA****************************
    ****************************************************************/

    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Intro. a Filosofia', 2);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Pré-Soc. Cosmologia', 2);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Pré-soc Ontologia', 2);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Sofistas e Sócrates', 2);";
    await db.execute(sql);

    /****************************************************************
    ************************INSERT DE CONTENT************************
    *****************************************************************
    *****************************FÍSICA******************************
    ****************************************************************/

    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Leis de Kepler', 3);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Leis de Newton', 3);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Satélite em Órbita Circ.', 3);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Lei da Gravitação Univ.', 3);";
    await db.execute(sql);

    /****************************************************************
    ************************INSERT DE CONTENT************************
    *****************************************************************
    ****************************GEOGRAFIA****************************
    ****************************************************************/

    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Conceitos Básicos', 4);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Dinâ. Inter. Crost.', 4);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Rota. e Transla.', 4);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Fusos Horários', 4);";
    await db.execute(sql);

    /****************************************************************
    ************************INSERT DE CONTENT************************
    *****************************************************************
    ****************************HISTÓRIA*****************************
    ****************************************************************/

    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Egito Antigo', 5);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Grécia Antiga', 5);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Mesopotâmia', 5);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Pré-História', 5);";
    await db.execute(sql);

    /****************************************************************
    ************************INSERT DE CONTENT************************
    *****************************************************************
    ****************************PORTUGUÊS****************************
    ****************************************************************/

    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Figuras Sonoras', 6);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Figuras de Sintaxe', 6);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Figuras de Linguagem', 6);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Figuras de Palavra', 6);";
    await db.execute(sql);

    /****************************************************************
    ************************INSERT DE CONTENT************************
    *****************************************************************
    ****************************QUÍMICA******************************
    ****************************************************************/

    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Conceitos Básicos', 7);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Química Inorgâ.', 7);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Físico-Química', 7);";
    await db.execute(sql);

    /****************************************************************
    ************************INSERT DE CONTENT************************
    *****************************************************************
    ***************************SOCIOLOGIA****************************
    ****************************************************************/

    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Teorias Sociológicas', 8);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Surgimento da Socio.', 8);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Sociedade Capitalista', 8);";
    await db.execute(sql);
    sql =
        "INSERT INTO assuntos (nome_assunto, id_materia_fk) VALUES ('Pensamento Científico', 8);";
    await db.execute(sql);
  }
}
