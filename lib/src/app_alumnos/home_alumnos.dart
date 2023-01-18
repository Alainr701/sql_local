import 'package:flutter/material.dart';
import 'package:sql_local/src/app_alumnos/alumno.dart';
import 'package:sql_local/src/app_alumnos/local_service.dart';

class HomeAlumnos extends StatefulWidget {
  const HomeAlumnos({super.key});

  @override
  State<HomeAlumnos> createState() => _HomeAlumnosState();
}

class _HomeAlumnosState extends State<HomeAlumnos> {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _ciController = TextEditingController();
  final _edadController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: LocalService.getAlumnoss(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${snapshot.data![index].nombre} ${snapshot.data![index].apellido}'),
                      subtitle: Text('${snapshot.data![index].ci}'),
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Editar Alumno'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: _nombreController
                                      ..text = snapshot.data![index].nombre,
                                    decoration: const InputDecoration(
                                      labelText: 'Nombre',
                                    ),
                                  ),
                                  TextField(
                                    controller: _apellidoController
                                      ..text = snapshot.data![index].apellido,
                                    decoration: const InputDecoration(
                                      labelText: 'Apellido',
                                    ),
                                  ),
                                  TextField(
                                    controller: _ciController
                                      ..text =
                                          snapshot.data![index].ci.toString(),
                                    decoration: const InputDecoration(
                                      labelText: 'CI',
                                    ),
                                  ),
                                  TextField(
                                    controller: _edadController
                                      ..text =
                                          snapshot.data![index].edad.toString(),
                                    decoration: const InputDecoration(
                                      labelText: 'Edad',
                                    ),
                                  ),
                                  TextField(
                                    controller: _emailController
                                      ..text = snapshot.data![index].email,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    LocalService.editAlumno(
                                      Alumno(
                                        id: snapshot.data![index].id,
                                        nombre: _nombreController.text,
                                        apellido: _apellidoController.text,
                                        ci: int.parse(_ciController.text),
                                        edad: int.parse(_edadController.text),
                                        email: _emailController.text,
                                      ),
                                    );
                                    setState(() {});
                                    // clean
                                    _nombreController.clear();
                                    _apellidoController.clear();
                                    _ciController.clear();
                                    _edadController.clear();
                                    _emailController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Guardar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await LocalService.deleteAlumno(
                              snapshot.data![index].id!);
                          setState(() {});
                        },
                      ),
                    );
                  },
                );
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Agregar Alumno'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _nombreController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                        ),
                      ),
                      TextField(
                        controller: _apellidoController,
                        decoration: const InputDecoration(
                          labelText: 'Apellido',
                        ),
                      ),
                      TextField(
                        controller: _ciController,
                        decoration: const InputDecoration(
                          labelText: 'Carnet de Identidad',
                        ),
                      ),
                      TextField(
                        controller: _edadController,
                        decoration: const InputDecoration(
                          labelText: 'Edad',
                        ),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_nombreController.text.isEmpty ||
                            _apellidoController.text.isEmpty ||
                            _ciController.text.isEmpty ||
                            _edadController.text.isEmpty ||
                            _emailController.text.isEmpty) {
                          return;
                        }
                        LocalService.addAlumno(Alumno(
                          nombre: _nombreController.text,
                          apellido: _apellidoController.text,
                          ci: int.parse(_ciController.text),
                          edad: int.parse(_edadController.text),
                          email: _emailController.text,
                        ));
                        // clean
                        _nombreController.clear();
                        _apellidoController.clear();
                        _ciController.clear();
                        _edadController.clear();
                        _emailController.clear();

                        setState(() {});
                        Navigator.of(context).pop();
                      },
                      child: const Text('Agregar'),
                    ),
                  ],
                );
              },
            );
            setState(() {});
          },
          child: const Icon(Icons.add),
        ));
  }
}
