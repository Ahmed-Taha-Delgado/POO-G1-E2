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

class CombateController {
  final CombateView view;
  final Random _random = Random();

  CombateController(this.view);

  void iniciarCombate(
    Pokemon p1,
    Pokemon p2,
    Ataque ataquePorDefecto,
  ) {
    // Mostrar info inicial
    view.mostrarInformacionPokemon(p1);
    view.mostrarInformacionPokemon(p2);

    print('========== COMBATE INICIADO ==========');

    while (p1.vida > 0 && p2.vida > 0) {
      if (p1.velocidad > p2.velocidad) {
        _turno(p1, p2, ataquePorDefecto);
      } else if (p2.velocidad > p1.velocidad) {
        _turno(p2, p1, ataquePorDefecto);
      } else {
        // Velocidades iguales, decidir al azar
        final velocidadIgual = _random.nextInt(2);
        if (velocidadIgual == 0) {
          _turno(p1, p2, ataquePorDefecto);
        } else {
          _turno(p2, p1, ataquePorDefecto);
        }
      }

      if (p1.vida <= 0) {
        p1.vida = 0;
        view.mostrarDesmayo(p1);
        view.mostrarGanador(p2, p1);
      } else if (p2.vida <= 0) {
        p2.vida = 0;
        view.mostrarDesmayo(p2);
        view.mostrarGanador(p1, p2);
      } else {
        view.mostrarSiguienteTurno();
      }
    }

    print('========== COMBATE TERMINADO ==========');
  }

  void _turno(Pokemon atacante, Pokemon defensor, Ataque ataque) {
    _atacar(atacante, defensor, ataque);
    if (defensor.vida > 0) {
      _atacar(defensor, atacante, ataque);
    }
  }

  void _atacar(Pokemon atacante, Pokemon defensor, Ataque ataque) {
    double vidaActual = defensor.vida;

    view.mostrarAtaque(atacante, defensor, ataque);

    double multiplicador = 1.0;

    if( (ataque.tipo == 'Fuego' && (defensor.tipo == 'Hierba' || defensor.tipo == 'Acero' || defensor.tipo == 'Hielo' || defensor.tipo == 'Bicho')) ||
        (ataque.tipo == 'Hierba' && (defensor.tipo == 'Agua' || defensor.tipo == 'Roca' || defensor.tipo == 'Tierra')) ||
        (ataque.tipo == 'Agua' && (defensor.tipo == 'Fuego' || defensor.tipo == 'Roca' || defensor.tipo == 'Tierra' )) ||
        (ataque.tipo == 'Acero' && (defensor.tipo == 'Hada' || defensor.tipo == 'Hielo' || defensor.tipo == 'Roca' )) ||
        (ataque.tipo == 'Bicho' && (defensor.tipo == 'Hierba' || defensor.tipo == 'Psiquico' || defensor.tipo == 'Siniestro')) ||
        (ataque.tipo == 'Dragon' && (defensor.tipo == 'Dragon' )) ||
        (ataque.tipo == 'Electrico' && (defensor.tipo == 'Agua' || defensor.tipo == 'Volador')) ||
        (ataque.tipo == 'Fantasma' && (defensor.tipo == 'Fantasma' || defensor.tipo == 'Psiquico')) ||
        (ataque.tipo == 'Hada' && (defensor.tipo == 'Dragon' || defensor.tipo == 'Lucha' || defensor.tipo == 'Siniestro')) ||
        (ataque.tipo == 'Hielo' && (defensor.tipo == 'Dragon' || defensor.tipo == 'Hierba' || defensor.tipo == 'Tierra' || defensor.tipo == 'Volador')) ||
        (ataque.tipo == 'Lucha' && (defensor.tipo == 'Acero' || defensor.tipo == 'Hielo' || defensor.tipo == 'Normal' || defensor.tipo == 'Roca' || defensor.tipo == 'Siniestro')) ||
        (ataque.tipo == 'Psiquico' && (defensor.tipo == 'Lucha' || defensor.tipo == 'Veneno')) ||
        (ataque.tipo == 'Roca' && (defensor.tipo == 'Bicho' || defensor.tipo == 'Fuego' || defensor.tipo == 'Hielo' || defensor.tipo == 'Volador')) ||
        (ataque.tipo == 'Siniestro' && (defensor.tipo == 'Fantasma' || defensor.tipo == 'Psiquico')) ||
        (ataque.tipo == 'Tierra' && (defensor.tipo == 'Acero' || defensor.tipo == 'Electrico' || defensor.tipo == 'Fuego' || defensor.tipo == 'Roca' || defensor.tipo == 'Veneno')) ||
        (ataque.tipo == 'Veneno' && (defensor.tipo == 'Hada' || defensor.tipo == 'Hierba')) ||
        (ataque.tipo == 'Volador' && (defensor.tipo == 'Bicho' || defensor.tipo == 'Lucha' || defensor.tipo == 'Planta')) ){
      multiplicador = 2.0;
      view.mostrarSuperEfectivo();
    }else if( (ataque.tipo == 'Fuego' && (defensor.tipo == 'Agua' || defensor.tipo == 'Dragon' || defensor.tipo == 'Fuego' || defensor.tipo == 'Roca')) ||
        (ataque.tipo == 'Hierba' && (defensor.tipo == 'Acero' || defensor.tipo == 'Bicho' || defensor.tipo == 'Dragon' || defensor.tipo == 'Fuego' || defensor.tipo == 'Hierba' || defensor.tipo == 'Veneno' || defensor.tipo == 'Volador')) ||
        (ataque.tipo == 'Agua' && (defensor.tipo == 'Agua' || defensor.tipo == 'Dragon' || defensor.tipo == 'Hierba' )) ||
        (ataque.tipo == 'Acero' && (defensor.tipo == 'Acero' || defensor.tipo == 'Agua' || defensor.tipo == 'Electrico' || defensor.tipo == 'Fuego')) ||
        (ataque.tipo == 'Bicho' && (defensor.tipo == 'Acero' || defensor.tipo == 'Fantasma' || defensor.tipo == 'Fuego' || defensor.tipo == 'Hada' || defensor.tipo == 'Lucha' || defensor.tipo == 'Veneno' || defensor.tipo == 'Volador')) ||
        (ataque.tipo == 'Dragon' && (defensor.tipo == 'Acero' )) ||
        (ataque.tipo == 'Electrico' && (defensor.tipo == 'Dragon' || defensor.tipo == 'Electrico' || defensor.tipo == 'Hierba')) ||
        (ataque.tipo == 'Fantasma' && (defensor.tipo == 'Siniestro')) ||
        (ataque.tipo == 'Hada' && (defensor.tipo == 'Acero' || defensor.tipo == 'Fuego' || defensor.tipo == 'Veneno')) ||
        (ataque.tipo == 'Hielo' && (defensor.tipo == 'Acero' || defensor.tipo == 'Agua' || defensor.tipo == 'Fuego' || defensor.tipo == 'Hielo')) ||
        (ataque.tipo == 'Lucha' && (defensor.tipo == 'Bicho' || defensor.tipo == 'Hada' || defensor.tipo == 'Psiquico' || defensor.tipo == 'Veneno' || defensor.tipo == 'Volador')) ||
        (ataque.tipo == 'Psiquico' && (defensor.tipo == 'Acero' || defensor.tipo == 'Psiquico')) ||
        (ataque.tipo == 'Roca' && (defensor.tipo == 'Acero' || defensor.tipo == 'Lucha' || defensor.tipo == 'Tierra')) ||
        (ataque.tipo == 'Siniestro' && (defensor.tipo == 'Hada' || defensor.tipo == 'Lucha'|| defensor.tipo == 'Siniestro')) ||
        (ataque.tipo == 'Tierra' && (defensor.tipo == 'Bicho' || defensor.tipo == 'Hierba')) ||
        (ataque.tipo == 'Veneno' && (defensor.tipo == 'Fantasma' || defensor.tipo == 'Roca'|| defensor.tipo == 'Tierra' || defensor.tipo == 'Veneno')) ||
        (ataque.tipo == 'Volador' && (defensor.tipo == 'Acero' || defensor.tipo == 'Electrico' || defensor.tipo == 'Roca')) ||
        (ataque.tipo == 'Normal' && (defensor.tipo == 'Acero' || defensor.tipo == 'Roca' )) ) {
      multiplicador = 0.5;
      view.mostrarPocoEfectivo();
    }else if((ataque.tipo == 'Dragon' && (defensor.tipo == 'Hada')) ||
        (ataque.tipo == 'Electrico' && (defensor.tipo == 'Tierra')) ||
        (ataque.tipo == 'Fantasma' && (defensor.tipo == 'Normal' )) ||
        (ataque.tipo == 'Lucha' && (defensor.tipo == 'Fantasma' )) ||
        (ataque.tipo == 'Normal' && (defensor.tipo == 'Fantasma' )) ||
        (ataque.tipo == 'Psiquico' && (defensor.tipo == 'Siniestro' )) ||
        (ataque.tipo == 'Tierra' && (defensor.tipo == 'Volador' )) ||
        (ataque.tipo == 'Veneno' && (defensor.tipo == 'Acero' ))){
      multiplicador = 0;
      view.mostrarNadaEfectivo();
    }

    final double danio = ataque.potencia * multiplicador;
    vidaActual -= danio;
    defensor.vida = vidaActual;
    view.mostrarDanio(danio);
  }
}