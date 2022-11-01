class Revision {
  double peso = 0;
  double temperatura = 0;
  double presion = 0;
  double saturacion = 0;

  Revision({
    required double peso,
    required double temperatura,
    required double presion,
    required double saturacion,
  }) {
    this.peso = peso;
    this.temperatura = temperatura;
    this.presion = presion;
    this.saturacion = saturacion;
  }

  set setPeso(double peso) => this.peso = peso;
  set setTemperatura(double temperatura) => this.temperatura = temperatura;
  set setPresion(double presion) => this.presion = presion;
  set setSaturacion(double saturacion) => this.saturacion = saturacion;

  double get getPeso => peso;
  double get getTemperatura => temperatura;
  double get getPresion => presion;
  double get getSaturacion => saturacion;
}
