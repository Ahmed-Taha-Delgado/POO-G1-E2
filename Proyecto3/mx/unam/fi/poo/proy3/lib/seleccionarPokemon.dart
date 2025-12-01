import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonpoo/finDeCombate.dart';
import 'package:pokemonpoo/interfazDeCombate.dart';
import 'package:pokemonpoo/musica.dart';
import 'package:pokemonpoo/tablaAtaques.dart';
import 'pokemones.dart';
import 'pokemon.dart';
import 'dart:math';
import 'archivos.dart';

void inicializarPokemones(){

  if(pokemonesElegidos.isNotEmpty){
    pokemonesElegidos.clear();
  }
  pokemones.clear();

  pokemones.addAll([
    PokemonElectrico(),
    PokemonAgua(),
    PokemonFuego(),
    PokemonHierba(),
    PokemonNormal(),
    PokemonTierra(),
    PokemonRoca(),
    PokemonAcero(),
    PokemonPsiquico(),
    PokemonDragon(),
    PokemonHada(),
    PokemonSiniestro(),
    PokemonFantasma(),
    PokemonHielo(),
    PokemonLucha(),
    PokemonVolador(),
    PokemonBicho(),
    PokemonVeneno(),
  ]);

}


List<Pokemon> pokemones = <Pokemon>[];
List<Pokemon> pokemonesElegidos = [];

class VentanaSeleccionarPokemon extends StatefulWidget{
  final bool musica;

  const VentanaSeleccionarPokemon({super.key, required this.musica});

  @override
  State<VentanaSeleccionarPokemon> createState() => _VentanaSeleccionarPokemonDinamica();
}

class _VentanaSeleccionarPokemonDinamica extends State<VentanaSeleccionarPokemon>{
  
  bool seleccionado = false;
  String nombreSeleccionado = "";
  int indice = -1;

  @override
  void initState(){
    super.initState();
    inicializarPokemones();

    if(widget.musica){
      Musica().activarMusicaMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(70),

        child: AppBar(
          toolbarHeight: 70,
          title: const Text('Seleccionar Pokémon'),
          titleTextStyle: GoogleFonts.pressStart2p(
            fontSize: 18,
            color: Colors.black,
          ),
          backgroundColor: const Color.fromARGB(255, 78, 113, 210),
          elevation: 20,
          shadowColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              seleccionado = false;
              pokemonesElegidos.clear();
              indice = -1;
              nombreSeleccionado = "";
              Navigator.pop(context);
            },
          ),
          actions: [
            botonTabla("Ataques", (){ 
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => VentanaTablaAtaques(musica: widget.musica))
              );
              
            }),
            botonArriba("Continuar", (){ 
              Random random = Random();
              int aleatorio = random.nextInt(17);
              while(indice == aleatorio){
                aleatorio = random.nextInt(18);
              }
              pokemonesElegidos.add(pokemones[aleatorio]);

              Pokemon miPokemon = pokemonesElegidos[0];
              Pokemon rival = pokemonesElegidos[1];
              
              rival.generarNivelRival(miPokemon.nivel);
              
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => InterfazDeCombate(pokeJugador: miPokemon, pokeEnemigo: rival, musica: widget.musica,)),
              );
            })
          ],
        ),
      ),
      
      body: Stack(
        
        children: [
          Positioned.fill(
            child: 
              imagenExcepcion("assets/Gifs/fondoPrincipal.gif", fit: BoxFit.cover),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GridView.count(
                
                crossAxisCount: 6,
                childAspectRatio: 0.65,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,

                children: [
                  

                  targetaPokemon(pokemones[0].nombre, pokemones[0].rutaA, Colors.yellow, Icons.flash_on, niveles[0], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[0].nombre;
                        pokemonesElegidos.add(pokemones[0]);
                        indice = 0;
                      }
                    }); 
                  }), 

                  targetaPokemon(pokemones[1].nombre, pokemones[1].rutaA, Colors.blue, Icons.water_drop, niveles[1], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[1].nombre;
                        pokemonesElegidos.add(pokemones[1]);
                        indice = 1;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[2].nombre, pokemones[2].rutaA, Colors.orange, Icons.local_fire_department, niveles[2],(){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[2].nombre;
                        pokemonesElegidos.add(pokemones[2]);
                        indice = 2;
                      }
                    }); 
                  }),
                        
                  targetaPokemon(pokemones[3].nombre, pokemones[3].rutaA, Colors.green, Icons.grass, niveles[3], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[3].nombre;
                        pokemonesElegidos.add(pokemones[3]);
                        indice = 3;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[4].nombre, pokemones[4].rutaA, Colors.brown, Icons.pets, niveles[4],(){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[4].nombre;
                        pokemonesElegidos.add(pokemones[4]);
                        indice = 4;
                      }
                    }); 
                  }), 

                  targetaPokemon(pokemones[5].nombre, pokemones[5].rutaA, const Color.fromARGB(255, 125, 123, 123), Icons.landscape, niveles[5],(){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[5].nombre;
                        pokemonesElegidos.add(pokemones[5]);
                        indice = 5;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[6].nombre, pokemones[6].rutaA, Color.fromARGB(255, 77, 28, 175), Icons.fitness_center, niveles[6],(){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[6].nombre;
                        pokemonesElegidos.add(pokemones[6]);
                        indice = 6;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[7].nombre, pokemones[7].rutaA, Color.fromARGB(255, 44, 83, 149), Icons.diamond, niveles[7],(){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[7].nombre;
                        pokemonesElegidos.add(pokemones[7]);
                        indice = 7;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[8].nombre, pokemones[8].rutaA,Color.fromARGB(255, 202, 125, 236), Icons.psychology, niveles[8], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[8].nombre;
                        pokemonesElegidos.add(pokemones[8]);
                        indice = 8;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[9].nombre, pokemones[9].rutaA, Color.fromARGB(255, 55, 96, 229), Icons.auto_awesome, niveles[9], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[9].nombre;
                        pokemonesElegidos.add(pokemones[9]);
                        indice = 9;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[10].nombre, pokemones[10].rutaA, Color.fromARGB(255, 199, 97, 148), Icons.auto_awesome, niveles[10], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[10].nombre;
                        pokemonesElegidos.add(pokemones[10]);
                        indice = 10;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[11].nombre, pokemones[11].rutaA, Color.fromARGB(255, 14, 14, 14), Icons.dark_mode_rounded, niveles[11], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[11].nombre;
                        pokemonesElegidos.add(pokemones[11]);
                        indice = 11;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[12].nombre, pokemones[12].rutaA, Color.fromARGB(255, 186, 149, 27), Icons.blur_on, niveles[12], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[12].nombre;
                        pokemonesElegidos.add(pokemones[12]);
                        indice = 12;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[13].nombre, pokemones[13].rutaA, Color.fromARGB(255, 56, 156, 210), Icons.ac_unit, niveles[13], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[13].nombre;
                        pokemonesElegidos.add(pokemones[13]);
                        indice = 13;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[14].nombre, pokemones[14].rutaA, Color.fromARGB(255, 175, 224, 231), Icons.sports_mma, niveles[14], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[14].nombre;
                        pokemonesElegidos.add(pokemones[14]);
                        indice = 14;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[15].nombre, pokemones[15].rutaA, Color.fromARGB(255, 55, 111, 63), Icons.air_rounded, niveles[15], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[15].nombre;
                        pokemonesElegidos.add(pokemones[15]);
                        indice = 15;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[16].nombre, pokemones[16].rutaA, Color.fromARGB(255, 154, 198, 220), Icons.bug_report_rounded, niveles[16], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[16].nombre;
                        pokemonesElegidos.add(pokemones[16]);
                        indice = 16;
                      }
                    }); 
                  }),

                  targetaPokemon(pokemones[17].nombre, pokemones[17].rutaA, Color.fromARGB(255, 122, 42, 126), Icons.science_rounded, niveles[17], (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                        if(pokemonesElegidos.isNotEmpty){
                          pokemonesElegidos.clear();
                        }
                        indice = -1;
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = pokemones[17].nombre;
                        pokemonesElegidos.add(pokemones[17]);
                        indice = 17;
                      }
                    
                    }); 
                  }),
                ],
              ),
            ),
          ),
        ], 
      ), 
    );
  }
  
  Widget targetaPokemon(String nombre, String ruta, Color color, IconData icono, int nivel,  VoidCallback onPressed){ 

    return Card(

      color: nombreSeleccionado == nombre? Colors.red : const Color.fromARGB(255, 239, 240, 237),
      elevation: nombreSeleccionado == nombre? 0: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Expanded(
                child: 
                  imagenExcepcion(ruta, fit: BoxFit.contain),
              ),
              

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icono, size: 32, color: color),
                  Flexible(
                    child: Text(
                      nombre,
                      style: GoogleFonts.pressStart2p(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              Text(
                "nivel: ${nivel}",
                style: GoogleFonts.pressStart2p(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),                
              ),
            ],
            )
        )
      )
    );
  }

  Widget botonTabla(String texto, VoidCallback onPressed){

    return Card(
      color: Colors.green,
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: onPressed,
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 14.0),
          child: Text(
                texto,
                style: GoogleFonts.pressStart2p(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
          ),
        ),
      ),
    );
  }

  Widget botonArriba(String texto, VoidCallback onPressed){

    return Card(
      color: seleccionado? Colors.green : Colors.grey,
      elevation: seleccionado? 15 : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: seleccionado? onPressed : null,
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 14.0),
          child: Text(
                texto,
                style: GoogleFonts.pressStart2p(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
          ),
        ),
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
}