import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonpoo/interfazDeCombate.dart';
import 'package:pokemonpoo/musica.dart';
import 'Pokemones.dart';

class VentanaSeleccionarPokemon extends StatefulWidget{
  const VentanaSeleccionarPokemon({super.key});

  @override
  State<VentanaSeleccionarPokemon> createState() => _VentanaSeleccionarPokemonDinamica();
}

class _VentanaSeleccionarPokemonDinamica extends State<VentanaSeleccionarPokemon>{

  bool seleccionado = false;
  String nombreSeleccionado = "";

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
          actions: [
            botonContinuar((){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => InterfazDeCombate(pokeJugador: PokemonAcero(nombre: "hola", nivel: 10), pokeEnemigo: PokemonAgua(nombre: "adios2", nivel: 3),)));
            })
          ],
        ),
      ),
      
      body: Stack(
        
        children: [
          Positioned.fill(
            child: Image.asset(
                "assets/Imagenes/fondoPrincipal.jpg",
                fit: BoxFit.cover,
              ),
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
                  

                  targetaPokemon("Pikachu",'assets/Gifs/ElectricoA.gif', Colors.yellow, Icons.flash_on, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Pikachu";
                      }
                    }); 
                  }), 

                  targetaPokemon("Blastoise", 'assets/Gifs/AguaA.gif', Colors.blue, Icons.water_drop, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Blastoise";
                      }
                    }); 
                  }),

                  targetaPokemon("Charmander", 'assets/Gifs/FuegoA.gif', Colors.orange, Icons.local_fire_department, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Charmander";
                      }
                    }); 
                  }),
                        
                  targetaPokemon("Sceptile", 'assets/Gifs/HierbaA.gif', Colors.green, Icons.grass, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Sceptile";
                      }
                    }); 
                  }),

                  targetaPokemon("Eevee", 'assets/Gifs/NormalA.gif', Colors.brown, Icons.pets, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Eevee";
                      }
                    }); 
                  }), 

                  targetaPokemon("Marowak", 'assets/Gifs/TierraA.gif', Colors.white, Icons.landscape, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Marowak";
                      }
                    }); 
                  }),

                  targetaPokemon("Melmetal", 'assets/Gifs/MetalA.gif', Color.fromARGB(255, 77, 28, 175), Icons.fitness_center, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Melmetal";
                      }
                    }); 
                  }),

                  targetaPokemon("Gigalith", 'assets/Gifs/RocaA.gif', Color.fromARGB(255, 44, 83, 149), Icons.diamond, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Gigalith";
                      }
                    }); 
                  }),

                  targetaPokemon("Mewtwo", 'assets/Gifs/PsiquicoA.gif',Color.fromARGB(255, 202, 125, 236), Icons.psychology, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Mewtwo";
                      }
                    }); 
                  }),

                  targetaPokemon("Dragonair", 'assets/Gifs/DragonA.gif', Color.fromARGB(255, 55, 96, 229), Icons.auto_awesome, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Dragonair";
                      }
                    }); 
                  }),

                  targetaPokemon("Clefairy", 'assets/Gifs/HadaA.gif', Color.fromARGB(255, 199, 97, 148), Icons.auto_awesome, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Clefairy";
                      }
                    }); 
                  }),

                  targetaPokemon("Umbreon", 'assets/Gifs/SiniestroA.gif', Color.fromARGB(255, 14, 14, 14), Icons.dark_mode_rounded, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Umbreon";
                      }
                    }); 
                  }),

                  targetaPokemon("Cofagrigus", 'assets/Gifs/FantasmaA.gif', Color.fromARGB(255, 186, 149, 27), Icons.blur_on, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Cofagrigus";
                      }
                    }); 
                  }),

                  targetaPokemon("Beartic", 'assets/Gifs/HieloA.gif', Color.fromARGB(255, 240, 224, 224), Icons.ac_unit, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Beartic";
                      }
                    }); 
                  }),

                  targetaPokemon("Machamp", 'assets/Gifs/LuchaA.gif', Color.fromARGB(255, 175, 224, 231), Icons.sports_mma, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Machamp";
                      }
                    }); 
                  }),

                  targetaPokemon("Tornadus", 'assets/Gifs/VoladorA.gif', Color.fromARGB(255, 55, 111, 63), Icons.air_rounded, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Tornadus";
                      }
                    }); 
                  }),

                  targetaPokemon("Accelgor", 'assets/gifs/BichoA.gif', Color.fromARGB(255, 154, 198, 220), Icons.bug_report_rounded, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Accelgor";
                      }
                    }); 
                  }),

                  targetaPokemon("Weezing", 'assets/Gifs/VenenoA.gif', Color.fromARGB(255, 122, 42, 126), Icons.science_rounded, (){
                    setState(() {
                      if(seleccionado){
                        seleccionado = false;
                        nombreSeleccionado = "";
                      }else{
                        seleccionado = true;
                        nombreSeleccionado = "Weezing";
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
  
  Widget targetaPokemon(String nombre, String ruta, Color color, IconData icono, VoidCallback onPressed){ 

    return Card(

      color: nombreSeleccionado == nombre? Colors.red : const Color.fromARGB(255, 239, 240, 237),
      elevation: nombreSeleccionado == nombre? 0: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Expanded(
                child: Image.asset(
                  ruta,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 10,),

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
            ],
            )
        )
      )
    );
  }

  Widget botonContinuar(VoidCallback onPressed){

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
                "Continuar",
                style: GoogleFonts.pressStart2p(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),

          
          ),
        ),
      ),
    );
  }

}

