import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonpoo/musica.dart';
import './seleccionarPokemon.dart';
import 'dart:io';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
                "assets/Imagenes/fondoPrincipal.jpg",
                fit: BoxFit.cover,
              ),
            ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                children: [
                  Text(
                    "POKEMÓN",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.luckiestGuy(
                      fontSize: 130,
                    ),
                  ),
                  _crearBoton(
                    Icons.catching_pokemon_rounded, "Jugar",Colors.red, (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => VentanaSeleccionarPokemon()))
                        ;
                    }),
                  _crearBoton(Icons.music_note, "Música", Colors.black, (){
                      Musica().activarMusicaMenu();
                    }),
                  _crearBoton(Icons.exit_to_app_rounded, "Salir", Colors.red, (){
                      exit(0);
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper para los botones
  Widget _crearBoton(IconData icon, String texto, Color color, VoidCallback onPressed) {
    return Align( // <--- 1. El Align evita que el ListView estire el botón
      alignment: Alignment.center, // Lo mantiene centrado
      child: SizedBox( // <--- 2. Aquí defines el tamaño real que quieres
        width: 300, 
        height: 80,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: color),
                const SizedBox(width: 15),
                Text(texto, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
