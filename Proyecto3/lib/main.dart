import 'package:flutter/material.dart';
import 'package:pokemonpoo/menuPrincipal.dart';
import 'dart:math';
import 'ataque.dart';
import 'ataques.dart';
import 'pokemon.dart';
import 'pokemones.dart';
import 'musica.dart';
import 'menuPrincipal.dart';

/// =========================
///         MAIN
/// =========================

///void main() {
///  final view = ConsoleCombateView();
///  final controller = CombateController(view);

///  final charmander = PokemonFuego(nombre: 'Charmander', nivel: 50);
///  final bulbasaur = PokemonHierba(nombre: 'Bulbasaur', nivel: 50);
///
///  final tacleada = AtaqueNormal(nombre: 'Tacleada', potencia: 35);
  // También podrías crear:
  // final lanzallamas = AtaqueFuego(nombre: 'Lanzallamas', potencia: 50);
  // final hojaAfilada = AtaqueHierba(nombre: 'Hoja Afilada', potencia: 40);

///  controller.iniciarCombate(charmander, bulbasaur, tacleada);
///}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // AQUÍ NACE EL NAVIGATOR 👇
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: ThemeData(primarySwatch: Colors.red),
      
      // Aquí llamamos a la pantalla hija. 
      // Al ser hija del MaterialApp, YA TIENE ACCESO al Navigator.
      home: MenuPrincipal(), 
    );
  }
}

/// =========================
///         VISTA
/// =========================

abstract class CombateView {
  void mostrarInformacionPokemon(Pokemon p);
  void mostrarAtaque(Pokemon atacante, Pokemon defensor, Ataque ataque);
  void mostrarSuperEfectivo();
  void mostrarPocoEfectivo();
  void mostrarNadaEfectivo();
  void mostrarDanio(double danio);
  void mostrarDesmayo(Pokemon p);
  void mostrarSiguienteTurno();
  void mostrarGanador(Pokemon ganador, Pokemon perdedor);
}

class ConsoleCombateView implements CombateView {
  @override
  void mostrarInformacionPokemon(Pokemon p) {
    print('Nombre: ${p.nombre}');
    print('Nivel: ${p.nivel}');
    print('Tipo: ${p.tipo}');
    print('Vida: ${p.vida.toInt()}');
    print('Velocidad: ${p.velocidad.toInt()}');
    print('----------------------');
  }

  @override
  void mostrarAtaque(Pokemon atacante, Pokemon defensor, Ataque ataque) {
    print(
        '${atacante.nombre} ataca a ${defensor.nombre} con ${ataque.nombre}!');
  }

  @override
  void mostrarSuperEfectivo() {
    print('¡Es súper efectivo!');
  }

  @override
  void mostrarPocoEfectivo() {
    print('¡No es muy efectivo!');
  }

  @override
    void mostrarNadaEfectivo(){
      print('¡El pokemon rival es inmune!');
    }

  @override
  void mostrarDanio(double danio) {
    print('El Pokémon rival recibe $danio puntos de daño.');
  }

  @override
  void mostrarDesmayo(Pokemon p) {
    print('¡${p.nombre} se ha desmayado!');
  }

  @override
  void mostrarSiguienteTurno() {
    print('-- Siguiente turno --');
  }

  @override
  void mostrarGanador(Pokemon ganador, Pokemon perdedor) {
    print(
        '¡${perdedor.nombre} ha sido derrotado!, ¡${ganador.nombre} gana el combate!');
  }
}

  
  
 








































/// =========================
///        MODELO
/// =========================








/// =========================
///      CONTROLADOR
/// =========================
