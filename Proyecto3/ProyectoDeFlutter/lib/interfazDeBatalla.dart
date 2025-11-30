import 'package:flutter/material.dart';
import 'dart:math';
import 'pokemones.dart';


class Interfazdebatalla extends StatelessWidget {
  final String pokemonJugador;
  final String spriteJugador;
  final String pokemonEnemigo;
  final String spriteEnemigo;

  const Interfazdebatalla({
    super.key,
    required this.pokemonJugador,
    required this.spriteJugador,

  });

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
                  "assets/Imagenes/SpritesPokemon/Enemigo.png",
                  height: 150,
                ),
              ),

              const Spacer(),

              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  spriteJugador,
                  height: 170,
                ),
              ),

              const SizedBox(height: 40),
            ],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  _botonBatalla("LUCHA", Icons.bolt, () {
                    print("Seleccione un ataque");
                  }),

                  _botonBatalla("MOCHILA", Icons.backpack, () {
                    print("Seleccione una poción");
                  }),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

    Widget _botonBatalla(String msg, IconData icono, VoidCallback onPressed){
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                IconButton(
                    icon: Icon(icono, size: 40),
                    onPressed: onPressed,
                ),
                
                Text(
                    msg,
                    style: const TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                    ),
                )
            ],
        );
    }
}