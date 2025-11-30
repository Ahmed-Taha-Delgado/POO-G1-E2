import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonpoo/musica.dart';
import './seleccionarPokemon.dart';
import 'dart:io';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalDinamico();

}

class _MenuPrincipalDinamico extends State<MenuPrincipal>{

  bool musica = true;
  
  @override
  void initState() {
    super.initState();
    Musica().activarMusicaMenu();
  }

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
                  Image.asset('assets/Imagenes/titulo.png'),
                  _crearBoton(
                    Icons.catching_pokemon_rounded, "Jugar",Colors.red, (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => VentanaSeleccionarPokemon()));
                    }),
                  _crearBoton(musica? Icons.music_note : Icons.music_off, "Música", Colors.black, (){ 
                      setState(() {
                        musica? musica = false : musica = true;
                        Musica().activarMusicaMenu();
                      });
                    }),
                  _crearBoton(Icons.exit_to_app_rounded, "Salir", Colors.black, (){
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
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: color),
                const SizedBox(width: 15),
                Text(
                  texto, 
                  style: GoogleFonts.pressStart2p(
                    fontSize: 15, 
                    fontWeight: FontWeight.bold,
                    )
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
