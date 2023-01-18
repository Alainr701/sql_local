
  // void initBD() async {
  //   var db = await databaseFactory.openDatabase(path);

  //   await db.execute('''
  // CREATE TABLE Alumno (
  //   id INTEGER PRIMARY KEY AUTOINCREMENT,
  //   nombre TEXT NOT NULL,
  //   apellido TEXT NOT NULL,
  //   edad INTEGER NOT NULL
  // )
  // ''');
  //   await db.insert('Product', <String, Object?>{'title': 2323});

  //   List<Map<String, dynamic>> result = await db.query('Product');
  //   print(result.length);
  //   print(result);

  //   await db.close();
  //   var databasesPath = await databaseFactory.getDatabasesPath();

  //   print('Databases path: $databasesPath');
  // }



  //  void createTabla() async {
  //   var db = await databaseFactory.openDatabase(path);
  //   await db.execute('''
  // CREATE TABLE Alumno (
  //   id INTEGER PRIMARY KEY AUTOINCREMENT,
  //   nombre TEXT NOT NULL,
  //   apellido TEXT NOT NULL,
  //   edad INTEGER NOT NULL
  // )
  // ''');
  //   await db.close();
  // }

  // void insertarAlumno(String nombre, String apellido, int edad) async {
  //   var db = await databaseFactory.openDatabase(path);
  //   await db.insert('Alumno', <String, Object?>{
  //     'nombre': nombre,
  //     'apellido': apellido,
  //     'edad': edad
  //   });
    
  //   List<Map<String, dynamic>> result = await db.query('Alumno');
  //   db.close();
  // }

  // void getAlumnos() async {
  //   var db = await databaseFactory.openDatabase(path);
  //   List<Map<String, dynamic>> result = await db.query('Alumno');
  //   for (var row in result) {
  //     print(row);
  //   }
  //   db.close();
  // }

  
  // void updaterAlumno(String nombre, String apellido, int edad) async {
  //   var db = await databaseFactory.openDatabase(path);
  //   // await db.insert('Alumno', <String, Object?>{
  //   //   'nombre': nombre,
  //   //   'apellido': apellido,
  //   //   'edad': edad
  //   // });
  //   await db.update(
  //     'Alumno',
  //     <String, Object?>{'nombre': nombre, 'apellido': apellido, 'edad': edad},
  //     where: 'id = 1',
  //   );
  // }