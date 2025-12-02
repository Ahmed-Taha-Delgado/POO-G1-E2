import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/modelo/modelo.dart';
import 'dart:math';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/controllador/combate.dart';

class InterfazDeCombate extends StatefulWidget {
  final Pokemon pokeJugador;
  final Pokemon pokeEnemigo;
  final bool musica;

  const InterfazDeCombate({
    super.key,
    required this.pokeJugador,
    required this.pokeEnemigo,
    required this.musica,
  });

  @override
  State<InterfazDeCombate> createState() => _InterfazDeCombateDinamica();
}

abstract class CombateView {
  void mostrarInformacionPokemon(Pokemon p);
  void mostrarAtaque(Pokemon atacante, Pokemon defensor, Ataque ataque);
  void mostrarDanio(double danio);
  void mostrarSuperEfectivo();
  void mostrarPocoEfectivo();
  void mostrarNadaEfectivo();
  void mostrarDesmayo(Pokemon p);
  void mostrarGanador(Pokemon ganador, Pokemon perdedor);
  void mostrarSiguienteTurno();
  void mostrarCambioVelocidadEnemigo(Pokemon p);
  void mostrarCambioVelocidadPropia(Pokemon p);
  void mostrarParalisis(Pokemon p);
  void mostrarVeneno(Pokemon p);
  void mostrarQuemadura(Pokemon p);
  void mostrarSuenio(Pokemon p);
  void mostrarCongelamiento(Pokemon p);
  void mostrarCura(Pokemon p);
  void mostrarDesperto(Pokemon p); 
  void mostrarDescongelo(Pokemon p);
  void mostrarObjetoUsado(Item item, Pokemon p);
}
class _InterfazDeCombateDinamica extends State<InterfazDeCombate> implements CombateView {

  late CombateController controller;
  late final vidaMaximaJugador;
  late final vidaMaximaEnemigo;
  late List<Item> listaPociones;
  List<Item> listaMochila = [];

  String textoenCombate = "¡El combate comienza!";

  @override
  void initState() {
    vidaMaximaJugador = widget.pokeJugador.vida;
    vidaMaximaEnemigo = widget.pokeEnemigo.vida;

    listaPociones = [
      Pocion(vidaMaxima: vidaMaximaJugador),
      PocionQuitarEnven(),
      PocionQuitarQuem(),
      PocionQuitarCong(),
      PocionQuitarPar(),
      PocionDespertar(),
    ];
    
    for(int i=0; i<3; i++){
      Random random = Random();
      listaMochila.add(listaPociones[random.nextInt(5)]);
    }
    
    super.initState();
    controller = CombateController(vista: this,
    jugador: widget.pokeJugador,
    enemigo: widget.pokeEnemigo,
    musica: widget.musica,
    );

    if(widget.musica){
      Musica().stop();
      Musica().musicaBatalla();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.iniciarCombate(widget.pokeJugador, widget.pokeEnemigo);
    });
  }

  @override
void mostrarObjetoUsado(Item item, Pokemon p) {
  setState(() {
    if (item is Pocion) {
      textoenCombate = "${p.nombre} recuperó salud.";
    } else if (item is PocionQuitarEnven) {
      textoenCombate = "${p.nombre} se curó del envenenamiento.";
    } else if (item is PocionQuitarQuem) {
      textoenCombate = "${p.nombre} se curó de la quemadura.";
    } else if (item is PocionQuitarCong) {
      textoenCombate = "${p.nombre} se descongeló.";
    } else if (item is PocionQuitarPar) {
      textoenCombate = "${p.nombre} ya no está paralizado.";
    } else if (item is PocionDespertar) {
      textoenCombate = "${p.nombre} despertó.";
    } else {
      textoenCombate = "${item.nombre} ha sido usado en ${p.nombre}.";
    }
  });
}

  @override
  void mostrarDescongelo(Pokemon p){
    setState(() {
      textoenCombate = "${p.nombre} se descongeló.";
    });
  }

  @override
  void mostrarDesperto(Pokemon p){
    setState(() {
      textoenCombate = "${p.nombre} despertó.";
    });
  }

  @override
  void mostrarCambioVelocidadPropia(Pokemon p){
    setState(() {
      textoenCombate = "La velocidad de ${p.nombre} aumento un 10%.";
    });
  }

  @override
  void mostrarCambioVelocidadEnemigo(Pokemon p){
    setState(() {
      textoenCombate = "La velocidad de ${p.nombre} enemigo ha disminuido 10%.";
    });
  }


 @override
  void mostrarParalisis(Pokemon p){
    setState(() {
      textoenCombate = "El Pokémon ha sido paralizado ";
    });
  }
  
  @override
  void mostrarSuenio(Pokemon p){
    setState(() {
      textoenCombate = "${p.nombre} se ha dormido.";
    });
  }

  @override
  void mostrarVeneno(Pokemon p){
    setState(() {
      textoenCombate = "${p.nombre} ha sido envenenado.";
    });
  }

  @override
  void mostrarQuemadura(Pokemon p){
    setState(() {
      textoenCombate = "${p.nombre} ha sido quemado";
    });
  }

  @override
  void mostrarCongelamiento(Pokemon p){
    setState(() {
      textoenCombate = "${p.nombre} se ha sido congelado.";
    });
  }
  
  @override
  void mostrarCura(Pokemon p){
    setState(() {
      textoenCombate = "${p.nombre} se ha curado.";
    });
  }

  @override
  void mostrarInformacionPokemon(Pokemon p) {
    setState(() {
      textoenCombate = "${p.nombre} entra en batalla";
    });
  }

  @override
  void mostrarAtaque(Pokemon atacante, Pokemon defensor, Ataque at) {
    setState(() {
      textoenCombate = "${atacante.nombre} usa ${at.nombre}!";
    });
  }

  @override
  void mostrarDanio(double danio) {
    setState(() {
      textoenCombate = " Causó $danio de daño.";
    });
  }

  @override
  void mostrarSuperEfectivo() {
    setState(() {
      textoenCombate = " ¡Es súper efectivo!";
    });
  }

  @override
  void mostrarPocoEfectivo() {
    setState(() {
      textoenCombate = " No es muy efectivo...";
    });
  }

  @override
  void mostrarNadaEfectivo() {
    setState(() {
      textoenCombate = " No afecta al enemigo.";
    });
  }

  @override
  void mostrarDesmayo(Pokemon poke) {
    setState(() {
      textoenCombate = "${poke.nombre} se ha debilitado.";
    });
  }

  @override
  void mostrarGanador(Pokemon ganador, Pokemon perdedor) {
    setState(() {
      textoenCombate = "${ganador.nombre} ha ganado el combate.";
    });
  }

  @override
  void mostrarSiguienteTurno() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: imagenExcepcion("assets/Gifs/fondoBatalla.gif",fit: BoxFit.cover),
          ),
          Positioned(
            top: 120,
            right: 250,
            child: SizedBox(
              width: 250,
              height: 250,
              child: imagenExcepcion(widget.pokeEnemigo.rutaA,fit: BoxFit.contain),
            ),
          ),
          Positioned(
            top: 40,
            right: 80,
            child: _PanelInfo(
              nombre: widget.pokeEnemigo.nombre, 
              nivel: widget.pokeEnemigo.nivel,   
              vidaActual: widget.pokeEnemigo.vida, 
              vidaMaxima: vidaMaximaEnemigo,
            ),
          ),

          Positioned(
            bottom: 55,
            left: 250,
            child: SizedBox(
              width: 350,
              height: 350,
              child: imagenExcepcion(widget.pokeJugador.rutaB, fit: BoxFit.contain),
            ),
          ),
          Positioned(
            top: 40,
            left: 80,
            child: _PanelInfo(
              nombre: widget.pokeJugador.nombre, 
              nivel: widget.pokeJugador.nivel,   
              vidaActual: widget.pokeJugador.vida, 
              vidaMaxima: vidaMaximaJugador,
            ),
          ),
          Positioned(
            top: 110,
            left: 80,
            child: Row(
              children: [
                Stack(
                  children: [
                    Text(
                      'Estado: ',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                    ),
                    Text(
                      'Estado: ',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Text(
                      definirEstado(widget.pokeJugador),
                      style: GoogleFonts.pressStart2p(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                    ),

                    Text(
                      definirEstado(widget.pokeJugador),
                      style: GoogleFonts.pressStart2p(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: definirColor(widget.pokeJugador),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 110,
            right: 80,
            child: Row(
              children: [
                Stack(
                  children: [
                    Text(
                      'Estado: ',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                    ),
                    Text(
                      'Estado: ',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Text(
                      definirEstado(widget.pokeEnemigo),
                      style: GoogleFonts.pressStart2p(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                    ),
                    Text(
                      definirEstado(widget.pokeEnemigo),
                      style: GoogleFonts.pressStart2p(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: definirColor(widget.pokeEnemigo),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                children: [
                  Text(
                    controller.enTurno? "Esperando\nataque" : "Tu turno",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.white,
                    ),
                  ),
                  Text(
                    controller.enTurno? "Esperando\nataque" : "Tu turno",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    textoenCombate,
                    style: GoogleFonts.pressStart2p(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _botonBatalla("LUCHA", Icons.bolt, () {
                        _mostrarMenuAtaques(context);
                      }
                      ),
                      _botonMochila("MOCHILA", Icons.backpack, () {
                        _mostrarMenuMochila();
                      }
                      ),                        
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imagenExcepcion(String ruta, {BoxFit fit = BoxFit.contain}) {
    return Image.asset(
      ruta,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          alignment: Alignment.center,
          color: Colors.grey,
        );
      },
    );
  }

  void _mostrarMenuAtaques(BuildContext contextWidget) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Selecciona un ataque: ", style: GoogleFonts.pressStart2p(fontSize: 10, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: controller.jugador.ataques.map((at) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.atacarJugador(at, contextWidget);
                  
                },
                child: Text(at.nombre),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _mostrarMenuMochila() {
    showDialog(
      context: context,
      builder: (contextD) {
        return AlertDialog(
          title: Text("Selecciona un item a utilizar: ", style: GoogleFonts.pressStart2p(fontSize: 10, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: listaMochila.map((item) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pop(contextD);
                  setState(() {
                    listaMochila.remove(item);
                  });
                  controller.usarObjeto(context,item);
                },
                child: Text(item.nombre),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _botonBatalla(String msg, IconData icono, VoidCallback onPressed) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, size: 24, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              msg,
              style: GoogleFonts.pressStart2p(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );

  
}

  Widget _botonMochila(String msg, IconData icono, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 252, 157, 34),
            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            elevation: 5,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.black, width: 2),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icono, size: 24, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                msg,
                style: GoogleFonts.pressStart2p(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  
}

class _PanelInfo extends StatelessWidget{
  final String nombre;
  final int nivel;
  final double vidaActual;
  final double vidaMaxima;

  const _PanelInfo({
    required this.nombre,
    required this.nivel,
    required this.vidaActual,
    required this.vidaMaxima,
  });
  

  @override
  Widget build(BuildContext context) {
    double porcentaje = (vidaActual / vidaMaxima).clamp(0.0, 1.0);
    Color peach = Color(0xFFFFCC99);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: peach.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$nombre  Nv.$nivel  ${vidaActual<0 ? 0.0 : vidaActual}/$vidaMaxima HP",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          
          Stack(  
            children: [
              Container(
                
                width: 300,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
              ),

              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 300 * porcentaje,
                height: 15,
                decoration: BoxDecoration(
                  color: porcentaje > 0.5 ? Colors.green : (porcentaje > 0.25 ? Colors.yellow : Colors.red),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
String definirEstado(Pokemon pokemon){

  if(pokemon.suenio){
    return "dormido";
  }else if(pokemon.congelado){
    return "congelado";
  }else if(pokemon.quem){
    return "quemado";
  }else if(pokemon.env){
    return "envenenado";
  }else if(pokemon.paralizado){
    return "paralizado";
  }
  return "sin efectos";
}

Color definirColor(Pokemon pokemon){

  if(pokemon.suenio){
    return Colors.grey;
  }else if(pokemon.congelado){
    return Colors.lightBlue;
  }else if(pokemon.quem){
    return Colors.deepOrange;
  }else if(pokemon.env){
    return Colors.purple;
  }else if(pokemon.paralizado){
    return Colors.amber;
  }
  return Colors.black;
}