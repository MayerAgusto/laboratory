import 'package:laboratory/objects/Revision.dart';

class Paciente {
  String nombres = "";
  String dni = "";
  double estatura = 0;
  String direccion = "";
  double lat = 0;
  double long = 0;
  List<Revision> revisiones = [];

  Paciente(
      {required String nombres,
      required String dni,
      required double estatura,
      required String direccion,
      required double lat,
      required double long}) {
    this.nombres = nombres;
    this.dni = dni;
    this.estatura = estatura;
    this.direccion = direccion;
    this.lat = lat;
    this.long = long;
  }

  set setName(String nombres) => this.nombres = nombres;
  set setDni(String dni) => this.dni = dni;
  set setEstatura(double estatura) => this.estatura = estatura;
  set setDireccion(String direccion) => this.direccion = direccion;
  set setLat(double lat) => this.lat = lat;
  set setLong(double long) => this.long = long;

  String get getNombres => nombres;
  String get getDni => dni;
  double get getEstatura => estatura;
  String get getDireccion => direccion;
  double get getLat => lat;
  double get getLong => long;
  List<Revision> get getRevisiones => revisiones;

  void addRevision(Revision revision) => revisiones.add(revision);
}
