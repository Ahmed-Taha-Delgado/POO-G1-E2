import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/modelo/modelo.dart';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/vista/vista.dart';

class CombateController {
  final CombateView vista;
  final Random _random = Random();

  final Pokemon jugador;
  final Pokemon enemigo;


  final double vidaMaximaJugador;
  final double vidaMaximaEnemigo;

  final bool musica;

  bool _turnoEnCurso = false;
  Duration _delayAnim = const Duration(milliseconds: 2000);


  CombateController({
    required this.vista,
    required this.jugador,
    required this.enemigo,
    required this.musica,
  }) : vidaMaximaJugador = jugador.vida, 
       vidaMaximaEnemigo = enemigo.vida;
  

  void iniciarCombate(Pokemon pokeJugador, Pokemon pokeEnemigo) async{
    vista.mostrarInformacionPokemon(jugador);
    await Future.delayed(const Duration(milliseconds : 2000));
    vista.mostrarInformacionPokemon(enemigo);
    await Future.delayed(const Duration(milliseconds : 2000));
    vista.mostrarSiguienteTurno();
  }

  void intentarAplicarEstdadoPorAtaque(Pokemon objetivo, Ataque ataque) async {
    if (ataque.estadoSecundario==null || ataque.probabilidadEstado== null){
      return;
    }
    double r=_random.nextDouble();
    if(r<=ataque.probabilidadEstado!){
      switch(ataque.estadoSecundario){
        case 'quemadura':
          objetivo.aplicarQuemadura();
          vista.mostrarQuemadura(objetivo);
          await Future.delayed(const Duration(milliseconds : 2000));
          break;
        case 'paralisis':
          objetivo.aplicarParalisis();
          objetivo.velocidad = objetivo.velocidad * 0.5;
          vista.mostrarParalisis(objetivo);
          await Future.delayed(const Duration(milliseconds : 2000));
          break;
        case 'congelacion':
          objetivo.aplicarCongelacion();
          objetivo.turnosEstados=3;
          vista.mostrarCongelamiento(objetivo);
          await Future.delayed(const Duration(milliseconds : 2000));
          break;
        case 'envenenamiento':
          objetivo.aplicarEnvenenamiento();
          vista.mostrarVeneno(objetivo);
          await Future.delayed(const Duration(milliseconds : 2000));
          break;
        case 'sueño':
          objetivo.aplicarSuenio();
          vista.mostrarSuenio(objetivo);
          objetivo.turnosEstados=3;
          await Future.delayed(const Duration(milliseconds : 2000));
          break;
      }
    }
  }
  void actualizarEstadosPokemon(Pokemon p) async{
   if (p.suenio) {
    p.turnosEstados--;
    if (p.turnosEstados <= 0) {
      p.suenio = false;
      p.turnosEstados = 0;
      vista.mostrarDesperto(p);
      await Future.delayed(const Duration(milliseconds : 2000));  
    }
   }else if (p.congelado) {
      p.turnosEstados--;
      if (p.turnosEstados <= 0) {
        p.congelado = false;
        p.turnosEstados = 0;
        vista.mostrarDescongelo(p);
        await Future.delayed(const Duration(milliseconds : 2000));
      }
   }   
  }


  void aplicarDanioEstados(Pokemon p){
  if (p.quem) {
    double danioCalculado = (p.vida * 0.0625).roundToDouble(); 
    double danio = danioCalculado < 1 ? 1 : danioCalculado;
    p.vida -= danio;
    if (p.vida < 0) p.vida = 0;
    vista.mostrarDanio(danio);

  }
  if (p.env) {
    double danioCalculado = (p.vida * 0.0625).roundToDouble(); 
    double danio = danioCalculado < 1 ? 1 : danioCalculado;
    p.vida -= danio;
    if (p.vida < 0) p.vida = 0;
    vista.mostrarDanio(danio);
  }
  }

  void curarPorAtaque(Pokemon atacante, Ataque ataque, double danio) {
  

  double porcentaje = 0;
  double vidaMax = (atacante == jugador) ? vidaMaximaJugador : vidaMaximaEnemigo;
  if (ataque.nombre == 'Chupavidas') {
    porcentaje = 0.5; 
  } else if (ataque.nombre == 'Beso drenaje') {
    porcentaje = 0.75; 
  }
  if (porcentaje == 0) return;
  double curacion = danio * porcentaje;
  atacante.vida += curacion;
  
  if (atacante.vida > vidaMax) {
    atacante.vida = vidaMax; 
  }
}

  Future<void> modificarVelocidadPorAtaque(Pokemon usuario, Pokemon enemigo, Ataque ataque)async{
    if(ataque.estadoSecundario=='velocidadPropia'){
    usuario.velocidad=usuario.velocidad*1.10;
    vista.mostrarCambioVelocidadPropia(usuario);
    await Future.delayed(const Duration(milliseconds : 2000));
    }else if(ataque.estadoSecundario=='velocidadEnemigo'){
      double r=_random.nextDouble();
      if(r<=ataque.probabilidadEstado!){
        enemigo.velocidad=enemigo.velocidad*0.9;
        vista.mostrarCambioVelocidadEnemigo(enemigo);
        await Future.delayed(const Duration(milliseconds : 2000));
     }}else{
    return;
    }   
 }
 
  bool puedeAtacar(Pokemon p){
    if (p.congelado || p.suenio){
      return false;
    }
    return true;
  }

  bool verificarParalisis(Pokemon p) {
  if (!p.paralizado) return true; 
  double r = _random.nextDouble(); 
  if (r <= 0.2){
    vista.mostrarParalisis(p);
    return true;   
  }
  return false;    
}

  Future<void> atacarJugador(Ataque ataqueJugador, BuildContext context) async {
    if (_turnoEnCurso) return;
    _turnoEnCurso = true;
    
    final Ataque ataqueEnemigo = enemigo.ataques[_random.nextInt(enemigo.ataques.length)];
    final bool ataqueJugadorPrioridad = ataqueJugador.prioridad>0;
    final bool ataqueEnemigoPrioridad = ataqueEnemigo.prioridad>0;

    if(ataqueJugadorPrioridad && !ataqueEnemigoPrioridad){
      await _ejecutarAtaque(jugador, enemigo, ataqueJugador);
      if (enemigo.vida > 0 ){
        await Future.delayed(_delayAnim);
        await _ejecutarAtaque(enemigo, jugador, ataqueEnemigo);
      }
      }else if(!ataqueJugadorPrioridad && ataqueEnemigoPrioridad){
        await _ejecutarAtaque(enemigo, jugador, ataqueEnemigo);
        if (jugador.vida > 0 ){
          await Future.delayed(_delayAnim);
          await _ejecutarAtaque(jugador, enemigo, ataqueJugador);
        }
      }else{
        final bool jugadorPrimero = jugador.velocidad >= enemigo.velocidad;
        if (jugadorPrimero) {
          await _ejecutarAtaque(jugador, enemigo, ataqueJugador);
          if (enemigo.vida > 0 ){
            await Future.delayed(_delayAnim);
            await _ejecutarAtaque(enemigo, jugador, ataqueEnemigo);
          }
        } else {
          await _ejecutarAtaque(enemigo, jugador, ataqueEnemigo);
          if (jugador.vida > 0 ){
            await Future.delayed(_delayAnim);
            await _ejecutarAtaque(jugador, enemigo, ataqueJugador);
          }
        }
      }
    if (jugador.vida <= 0 || enemigo.vida <= 0) {
      _finalizarCombate(context);
      _turnoEnCurso = false;
      return;
    }

    aplicarDanioEstados(jugador);
    aplicarDanioEstados(enemigo);
    actualizarEstadosPokemon(jugador);
    actualizarEstadosPokemon(enemigo);
    vista.mostrarSiguienteTurno();
    _turnoEnCurso = false;
  }

  Future<void> _ejecutarAtaque(Pokemon atacante, Pokemon defensor, Ataque ataque) async {
    
    await modificarVelocidadPorAtaque(atacante, defensor, ataque);
    if(!puedeAtacar(atacante))
    {
      return;
    }
    if (!verificarParalisis(atacante)){
    vista.mostrarParalisis(atacante);
    await Future.delayed(_delayAnim);
    return; 
    }
    vista.mostrarAtaque(atacante, defensor, ataque);
    await Future.delayed(_delayAnim);

    final multiplicador = _multiplicadorPorTipo(ataque.tipo, defensor.tipo);
    if (multiplicador == 2.0) {
        vista.mostrarSuperEfectivo();
        await Future.delayed(const Duration(milliseconds: 2000));
    } else if (multiplicador == 0.5) {
        vista.mostrarPocoEfectivo();
        await Future.delayed(const Duration(milliseconds: 2000));
    } else if (multiplicador == 0.0) {
        vista.mostrarNadaEfectivo();
        await Future.delayed(const Duration(milliseconds: 2000));
    }

    final double danio = _calcularDanio(ataque, atacante, defensor);
    defensor.vida -= danio;
    vista.mostrarDanio(danio);
    curarPorAtaque(atacante, ataque, danio);
    await Future.delayed(_delayAnim);

    if (defensor.vida>0){
      intentarAplicarEstdadoPorAtaque(defensor, ataque);
      await Future.delayed(_delayAnim);
    }
  }

  Future<void> usarObjeto(BuildContext context,Item item) async {
    if (_turnoEnCurso) return;
    _turnoEnCurso = true;
  
    item.usar(jugador);
    vista.mostrarObjetoUsado(item, jugador);
    vista.mostrarSiguienteTurno();

    await Future.delayed(_delayAnim);

    if (enemigo.vida > 0 && !enemigo.congelado && !enemigo.suenio) {
        await _turnoEnemigo();
    }

    if (jugador.vida <= 0) {
      _finalizarCombate(context);
      _turnoEnCurso = false;
      return;
    }

    aplicarDanioEstados(jugador);
    aplicarDanioEstados(enemigo);

    actualizarEstadosPokemon(jugador);
    actualizarEstadosPokemon(enemigo);
    
    vista.mostrarSiguienteTurno();
    _turnoEnCurso = false;
  }

  Future<void> _turnoEnemigo() async {
    final ataqueEnemigo = enemigo.ataques[_random.nextInt(enemigo.ataques.length)];
    await _ejecutarAtaque(enemigo, jugador, ataqueEnemigo);
  }

  Future<void> _finalizarCombate(BuildContext context) async {
    if(musica){
      Musica().stop();
      Musica().musicaVictoria();
    }
    if (jugador.vida <= 0) {
      jugador.vida = 0;
      vista.mostrarDesmayo(jugador);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => VentanaFinDeCombate(musica: musica, pokemonFinal: jugador, victoria: false)),
          
      );
    } else if (enemigo.vida <= 0) {
      enemigo.vida = 0;
      vista.mostrarDesmayo(enemigo);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => VentanaFinDeCombate(musica: musica, pokemonFinal: jugador, victoria: true)),
      );
    }
  }

  double _calcularDanio(Ataque ataque, Pokemon atacante, Pokemon defensor) {
    return ataque.potencia.toDouble() * _multiplicadorPorTipo(ataque.tipo, defensor.tipo);
  }

  double _multiplicadorPorTipo(String tipoAtaque, String tipoDefensor) {
    if ((tipoAtaque == 'Fuego' && (tipoDefensor == 'Hierba' || tipoDefensor == 'Acero' || tipoDefensor == 'Hielo' || tipoDefensor == 'Bicho')) ||
        (tipoAtaque == 'Hierba' && (tipoDefensor == 'Agua' || tipoDefensor == 'Roca' || tipoDefensor == 'Tierra')) ||
        (tipoAtaque == 'Agua' && (tipoDefensor == 'Fuego' || tipoDefensor == 'Roca' || tipoDefensor == 'Tierra')) ||
        (tipoAtaque == 'Acero' && (tipoDefensor == 'Hada' || tipoDefensor == 'Hielo' || tipoDefensor == 'Roca')) ||
        (tipoAtaque == 'Bicho' && (tipoDefensor == 'Hierba' || tipoDefensor == 'Psiquico' || tipoDefensor == 'Siniestro')) ||
        (tipoAtaque == 'Dragon' && (tipoDefensor == 'Dragon')) ||
        (tipoAtaque == 'Electrico' && (tipoDefensor == 'Agua' || tipoDefensor == 'Volador')) ||
        (tipoAtaque == 'Fantasma' && (tipoDefensor == 'Fantasma' || tipoDefensor == 'Psiquico')) ||
        (tipoAtaque == 'Hada' && (tipoDefensor == 'Dragon' || tipoDefensor == 'Lucha' || tipoDefensor == 'Siniestro')) ||
        (tipoAtaque == 'Hielo' && (tipoDefensor == 'Dragon' || tipoDefensor == 'Hierba' || tipoDefensor == 'Tierra' || tipoDefensor == 'Volador')) ||
        (tipoAtaque == 'Lucha' && (tipoDefensor == 'Acero' || tipoDefensor == 'Hielo' || tipoDefensor == 'Normal' || tipoDefensor == 'Roca' || tipoDefensor == 'Siniestro')) ||
        (tipoAtaque == 'Psiquico' && (tipoDefensor == 'Lucha' || tipoDefensor == 'Veneno')) ||
        (tipoAtaque == 'Roca' && (tipoDefensor == 'Bicho' || tipoDefensor == 'Fuego' || tipoDefensor == 'Hielo' || tipoDefensor == 'Volador')) ||
        (tipoAtaque == 'Siniestro' && (tipoDefensor == 'Fantasma' || tipoDefensor == 'Psiquico')) ||
        (tipoAtaque == 'Tierra' && (tipoDefensor == 'Acero' || tipoDefensor == 'Electrico' || tipoDefensor == 'Fuego' || tipoDefensor == 'Roca' || tipoDefensor == 'Veneno')) ||
        (tipoAtaque == 'Veneno' && (tipoDefensor == 'Hada' || tipoDefensor == 'Hierba')) ||
        (tipoAtaque == 'Volador' && (tipoDefensor == 'Bicho' || tipoDefensor == 'Lucha' || tipoDefensor == 'Planta')) ) {
      return 2.0;
    }

    if ((tipoAtaque == 'Fuego' && (tipoDefensor == 'Agua' || tipoDefensor == 'Dragon' || tipoDefensor == 'Fuego' || tipoDefensor == 'Roca')) ||
        (tipoAtaque == 'Hierba' && (tipoDefensor == 'Acero' || tipoDefensor == 'Bicho' || tipoDefensor == 'Dragon' || tipoDefensor == 'Fuego' || tipoDefensor == 'Hierba' || tipoDefensor == 'Veneno' || tipoDefensor == 'Volador')) ||
        (tipoAtaque == 'Agua' && (tipoDefensor == 'Agua' || tipoDefensor == 'Dragon' || tipoDefensor == 'Hierba')) ||
        (tipoAtaque == 'Acero' && (tipoDefensor == 'Acero' || tipoDefensor == 'Agua' || tipoDefensor == 'Electrico' || tipoDefensor == 'Fuego')) ||
        (tipoAtaque == 'Bicho' && (tipoDefensor == 'Acero' || tipoDefensor == 'Fantasma' || tipoDefensor == 'Fuego' || tipoDefensor == 'Hada' || tipoDefensor == 'Lucha' || tipoDefensor == 'Veneno' || tipoDefensor == 'Volador')) ||
        (tipoAtaque == 'Dragon' && (tipoDefensor == 'Acero')) ||
        (tipoAtaque == 'Electrico' && (tipoDefensor == 'Dragon' || tipoDefensor == 'Electrico' || tipoDefensor == 'Hierba')) ||
        (tipoAtaque == 'Fantasma' && (tipoDefensor == 'Siniestro')) ||
        (tipoAtaque == 'Hada' && (tipoDefensor == 'Acero' || tipoDefensor == 'Fuego' || tipoDefensor == 'Veneno')) ||
        (tipoAtaque == 'Hielo' && (tipoDefensor == 'Acero' || tipoDefensor == 'Agua' || tipoDefensor == 'Fuego' || tipoDefensor == 'Hielo')) ||
        (tipoAtaque == 'Lucha' && (tipoDefensor == 'Bicho' || tipoDefensor == 'Hada' || tipoDefensor == 'Psiquico' || tipoDefensor == 'Veneno' || tipoDefensor == 'Volador')) ||
        (tipoAtaque == 'Psiquico' && (tipoDefensor == 'Acero' || tipoDefensor == 'Psiquico')) ||
        (tipoAtaque == 'Roca' && (tipoDefensor == 'Acero' || tipoDefensor == 'Lucha' || tipoDefensor == 'Tierra')) ||
        (tipoAtaque == 'Siniestro' && (tipoDefensor == 'Hada' || tipoDefensor == 'Lucha' || tipoDefensor == 'Siniestro')) ||
        (tipoAtaque == 'Tierra' && (tipoDefensor == 'Bicho' || tipoDefensor == 'Hierba')) ||
        (tipoAtaque == 'Veneno' && (tipoDefensor == 'Fantasma' || tipoDefensor == 'Roca' || tipoDefensor == 'Tierra' || tipoDefensor == 'Veneno')) ||
        (tipoAtaque == 'Volador' && (tipoDefensor == 'Acero' || tipoDefensor == 'Electrico' || tipoDefensor == 'Roca')) ||
        (tipoAtaque == 'Normal' && (tipoDefensor == 'Acero' || tipoDefensor == 'Roca')) ) {
      return 0.5;
    }

    if ((tipoAtaque == 'Dragon' && (tipoDefensor == 'Hada')) ||
        (tipoAtaque == 'Electrico' && (tipoDefensor == 'Tierra')) ||
        (tipoAtaque == 'Fantasma' && (tipoDefensor == 'Normal')) ||
        (tipoAtaque == 'Lucha' && (tipoDefensor == 'Fantasma')) ||
        (tipoAtaque == 'Normal' && (tipoDefensor == 'Fantasma')) ||
        (tipoAtaque == 'Psiquico' && (tipoDefensor == 'Siniestro')) ||
        (tipoAtaque == 'Tierra' && (tipoDefensor == 'Volador')) ||
        (tipoAtaque == 'Veneno' && (tipoDefensor == 'Acero')) ) {
      return 0.0;
    }
    return 1.0;
  }
  bool get enTurno => _turnoEnCurso;
  set enTurno(bool turno){
    _turnoEnCurso = turno;
  }
}