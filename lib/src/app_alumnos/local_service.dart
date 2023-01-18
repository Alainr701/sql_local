import 'package:sql_local/src/app_alumnos/alumno.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

const path = 'F:/2023/proyectos flutter/sql_local/database.db';
var databaseFactory = databaseFactoryFfi;

class LocalService {
  static Future<void> addAlumno(Alumno alumno) async {
    var db = await databaseFactory.openDatabase(path);
    await db.insert('Alumno', alumno.toJson());
    db.close();
  }

  static Future<void> editAlumno(Alumno alumno) async {
    var db = await databaseFactory.openDatabase(path);
    await db.update('Alumno', alumno.toJson(),
        where: 'id = ?', whereArgs: [alumno.id]);
    db.close();
  }

  static Future<List<Alumno>> getAlumnoss() async {
    List<Alumno> alumnos = [];
    var db = await databaseFactory.openDatabase(path);
    List<Map<String, dynamic>> result = await db.query('Alumno');
    db.close();
    for (var row in result) {
      alumnos.add(Alumno.fromJson(row));
    }
    return alumnos;
  }

  static Future<void> deleteAlumno(int id) async {
    var db = await databaseFactory.openDatabase(path);
    await db.delete('Alumno', where: 'id = ?', whereArgs: [id]);
    db.close();
  }
}
