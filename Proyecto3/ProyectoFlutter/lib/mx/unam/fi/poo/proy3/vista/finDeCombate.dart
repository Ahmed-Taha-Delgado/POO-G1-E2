import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/modelo/modelo.dart';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/vista/vista.dart';

class VentanaFinDeCombate extends StatefulWidget{
  
  final Pokemon pokemonFinal;
  final bool musica;
  final bool victoria;
  
  const VentanaFinDeCombate({super.key, required this.pokemonFinal, required this.musica, required this.victoria});

  @override
  State<VentanaFinDeCombate> createState() => _VentanaFinDeCombateDinamica();
}

class _VentanaFinDeCombateDinamica extends State<VentanaFinDeCombate>{
  
  Future<void> _guardarYSalir(VoidCallback navegar) async {
    
    if (widget.victoria) {
      widget.pokemonFinal.nivel++;
      
      int indice = _obtenerIndicePorTipo(widget.pokemonFinal.tipo);

      if (indice!=-1) {
        if (niveles.isEmpty){
           await leerArchivo(); 
        }

        if (niveles.length>indice){
          niveles[indice]=widget.pokemonFinal.nivel;
          await sobreEscribir(); 
        } 
      } 
    }

    navegar();
  }

  int _obtenerIndicePorTipo(String tipo) {
    switch (tipo) {
      case 'Electrico': return 0;
      case 'Agua': return 1;
      case 'Fuego': return 2;
      case 'Hierba': return 3;
      case 'Normal': return 4;
      case 'Tierra': return 5;
      case 'Roca': return 6;
      case 'Acero': return 7;
      case 'Psiquico': return 8;
      case 'Dragon': return 9;
      case 'Hada': return 10;
      case 'Siniestro': return 11;
      case 'Fantasma': return 12;
      case 'Hielo': return 13;
      case 'Lucha': return 14;
      case 'Volador': return 15;
      case 'Bicho': return 16;
      case 'Veneno': return 17;
      default: return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(70),

        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: const Text('Fin de la batalla'),
          titleTextStyle: GoogleFonts.pressStart2p(
            fontSize: 18,
            color: Colors.black,
          ),
          backgroundColor: const Color.fromARGB(255, 78, 113, 210),
          elevation: 20,
          shadowColor: Colors.black,
          actions: [
            botonContinuar("Volver a Jugar",(){ 
              _guardarYSalir(() {
                if(widget.musica){
                  Musica().musicaBatalla();
                  Musica().musicaVictoria();
                }
                  
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => VentanaSeleccionarPokemon(musica: widget.musica)),
                );
              });
            }),

            const SizedBox(width: 10),

            botonContinuar("Menú Principal", (){
              
              _guardarYSalir((){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => MenuPrincipal()),
                );
              });
            }),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child:imagenExcepcion("assets/Gifs/fondoPrincipal.gif", fit: BoxFit.cover),
          ),

          Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                
                children: [

                  Text(
                    widget.victoria? "VICTORIA" : "DERROTA",
                    style: GoogleFonts.pressStart2p(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: widget.victoria? Colors.green : Colors.red,
                    ),
                  ),  

                  Text(
                    widget.victoria? "¡¡Subes de nivel!!" : "Suerte para la próxima",
                    style: GoogleFonts.pressStart2p(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),    
                  ),

                  _tarjetaPokemon(widget.pokemonFinal.rutaA, widget.pokemonFinal.nombre, widget.pokemonFinal.nivel, widget.pokemonFinal.tipo, widget.pokemonFinal.ataques),
                ],
              ),
            ),
          ),
        ],

      ),
    );
  }

  Widget _tarjetaPokemon(String ruta, String nombre, int lvl, String tipo, List<Ataque> ataques){

    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 400, 
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              height: 300,
              child: imagenExcepcion(ruta, fit: BoxFit.contain),
            ),
            

            SizedBox(height: 20,),

            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text(
                    'Nombre: $nombre',
                    style: GoogleFonts.pressStart2p(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Nivel: $lvl',
                        style: GoogleFonts.pressStart2p(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),

                      widget.victoria
                      ? Text(
                        ' + 1',
                          style: GoogleFonts.pressStart2p(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.green,
                          )
                        )
                        : const SizedBox.shrink(),
                      
                    ],
                  ),
                  
                  Text(
                    'Tipo: $tipo',
                    style: GoogleFonts.pressStart2p(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
            ),
          ],
        ),
      ),
    );
  }

  Widget botonContinuar(String texto, VoidCallback onPressed){

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