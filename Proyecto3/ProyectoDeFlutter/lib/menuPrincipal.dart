import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonpoo/musica.dart';
import './seleccionarPokemon.dart';
import 'dart:io';
import 'archivos.dart';

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

    if(musica){
      Musica().activarMusicaMenu();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
                "assets/Gifs/fondoPrincipal.gif",
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
                        MaterialPageRoute(builder: (context) => VentanaSeleccionarPokemon(musica: musica)));
                    }),
                  _crearBoton(musica? Icons.music_note : Icons.music_off, "Música", Colors.black, (){ 
                      setState(() {
                        if(musica){
                          musica = false;
                          Musica().stop();
                        }else{
                          musica = true;
                          Musica().activarMusicaMenu();
                        }
                       
                      });
                    }),
                  _crearBoton(Icons.exit_to_app_rounded, "Salir", Colors.black, (){
                      exit(0);
                    }),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                botonExtra("Reiniciar niveles", Colors.grey, (){
                  for(int i=0; i<18; i++){
                    niveles[i] = 1;
                  }
                  sobreEscribir();
                }),
              ],
            ),
          ),
        
        ],
      ),
    );
  }

  Widget _crearBoton(IconData icon, String texto, Color color, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
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

  Widget botonExtra(String texto, Color color, VoidCallback onPressed){
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 230, 
        height: 40,
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 15),
                Text(
                  texto, 
                  style: GoogleFonts.pressStart2p(
                    fontSize: 8, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}