// nombre, apellido,ci ,edad, and email
class Alumno {
  int? id;
  String nombre;
  String apellido;
  int ci;
  int edad;
  String email;

  Alumno({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.ci,
    required this.edad,
    required this.email,
  });

  factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        id: json['id'],
        nombre: json['nombre'],
        apellido: json['apellido'],
        ci: json['ci'],
        edad: json['edad'],
        email: json['email'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'apellido': apellido,
        'ci': ci,
        'edad': edad,
        'email': email,
      };
}
