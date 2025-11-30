import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'ataques.dart';
import 'combate.dart';
import 'ataque.dart';
import 'main.dart';

class InterfazDeCombate extends StatefulWidget {
  final Pokemon pokeJugador;
  final Pokemon pokeEnemigo;

  const InterfazDeCombate({
    super.key,
    required this.pokeJugador,
    required this.pokeEnemigo,
  });

  @override
  _InterfazDeCombateState createState() => _InterfazDeCombateState();
}

class _InterfazDeCombateState extends State<InterfazDeCombate>
    implements CombateView {

  late CombateController controller;
  String textoCombate = "¡El combate comienza!";

  @override
  void initState() {
    super.initState();
    controller = CombateController(this);
  }

  @override
  void mostrarInformacionPokemon(Pokemon p) {
    setState(() {
      textoCombate = "${p.nombre} entra en batalla. Vida: ${p.vida}";
    });
  }

  @override
  void mostrarAtaque(Pokemon atacante, Pokemon defensor, Ataque at) {
    setState(() {
      textoCombate = "${atacante.nombre} usa ${at.nombre}!";
    });
  }

  @override
  void mostrarDanio(double danio) {
    setState(() {
      textoCombate += " Causó $danio de daño.";
    });
  }

  @override
  void mostrarSuperEfectivo() {
    setState(() {
      textoCombate += " ¡Es súper efectivo!";
    });
  }

  @override
  void mostrarPocoEfectivo() {
    setState(() {
      textoCombate += " No es muy efectivo...";
    });
  }

  @override
  void mostrarNadaEfectivo() {
    setState(() {
      textoCombate += " No afecta al enemigo.";
    });
  }

  @override
  void mostrarDesmayo(Pokemon poke) {
    setState(() {
      textoCombate = "${poke.nombre} se ha debilitado.";
    });
  }

  @override
  void mostrarGanador(Pokemon ganador, Pokemon perdedor) {
    setState(() {
      textoCombate = "${ganador.nombre} ha ganado el combate.";
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
            child: Image.asset(
              "assets/Imagenes/fondoBatalla.png",
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/Imagens/SpritesPokemon",
                  height: 150,
                ),
              ),

              const Spacer(),

              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/Imagenes/SpritesPokemon",
                  height: 170,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 220,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    textoCombate,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _botonBatalla("LUCHA", Icons.bolt, () {
                        _mostrarMenuAtaques();
                      }
                      ),
                      _botonMochila("MOCHILA", Icons.backpack, () {}),
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

  void _mostrarMenuAtaques() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Elige un ataque: "),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.pokeJugador.ataques.map((at) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.iniciarCombate(widget.pokeJugador, widget.pokeEnemigo);
                },
                child: Text(at.nombre),
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
        IconButton(
          icon: Icon(icono, size: 40),
          onPressed: onPressed,
        ),
        Text(
          msg,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _botonMochila(String msg, IconData icono, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icono, size: 40),
          onPressed: onPressed,
        ),
        Text(
          msg,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
