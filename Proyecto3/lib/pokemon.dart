import 'dart:math';
import 'ataque.dart';

class Pokemon {
  final String nombre;
  final int nivel;
  final String tipo;
  double vida;
  final double velocidad;
  bool quemEnv = false;
  bool congelado = false;
  bool paralizado = false;
  

  List<Ataque> ataques = [];

  static final Random _random = Random();

  Pokemon({
    required this.nombre,
    required this.nivel,
    required this.tipo,
  })  : vida = (_random.nextDouble() * 5 + 1) * nivel,
        velocidad = (_random.nextDouble() * 3 + 1) * nivel;
}