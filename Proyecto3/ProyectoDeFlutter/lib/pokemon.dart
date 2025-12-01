import 'dart:math';
import 'ataque.dart';

class Pokemon {
  final String nombre;
  int nivel;
  final String tipo;
  double vida;
  double velocidad;
  bool quem = false;
  bool congelado = false;
  bool paralizado = false;
  bool env= false;
  bool suenio=false;
  int turnosEstados=0;
  
  final String rutaA;
  final String rutaB;

  
  List<Ataque> ataques = [];

  static final Random _random = Random();

  Pokemon({
    required this.nombre,
    required this.nivel,
    required this.tipo,
    required this.rutaA,
    required this.rutaB,
    required this.ataques,
  })  : vida = ((_random.nextInt(11) + 120) + (10 * nivel)).toDouble(),
        velocidad = (_random.nextDouble() * 0.2 + 1) * nivel;
        
    bool get tieneEstado=> quem==true||congelado==true||paralizado==true||env==true;
    
  void aplicarQuemadura() {
    quem = true;
    congelado = false;
    paralizado = false;
    env=false;
    suenio=false;
  }

  void aplicarCongelacion() {
    congelado = true;
    quem = false;
    paralizado = false;
    env=false;
    suenio=false;
  }

  void aplicarParalisis() {
    paralizado = true;
    quem = false;
    congelado = false;
    env=false;
    suenio=false;
  }
  void aplicarEnvenenamiento() {
    paralizado = false;
    quem = false;
    congelado = false;
    env=true;
    suenio=false;
  }
  void aplicarSuenio() {
    congelado = false;
    quem = false;
    paralizado = false;
    env=false;
    suenio=true;
  }

  void generarNivelRival(int nivelBaseJugador) {
    
    int variacion = _random.nextInt(6) - 2; 
    int nuevoNivel = nivelBaseJugador + variacion;

    if (nuevoNivel<1) nuevoNivel = 1;

    nivel = nuevoNivel;
    vida = ((_random.nextInt(11) + 120) + (10 * nivel)).toDouble();
    velocidad = (_random.nextDouble() * 0.2 + 1) * nivel;
  }
}