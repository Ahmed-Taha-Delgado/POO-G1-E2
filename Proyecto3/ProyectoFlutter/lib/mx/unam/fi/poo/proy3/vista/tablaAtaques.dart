import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/modelo/modelo.dart';



final List<Ataque> todosLosAtaques = [
  rayo, ondaTrueno, impactoTrueno, ataqueRapido,
  hidroBomba, surf, acuajet, escaldar,
  llamarada, nitrocarga, ascuas, 
  latigazo, brazopincho, hojaafilada, votoplanta, 
  alboroto, araniazo, atizar, corte, ataqueRapido,
  terremoto, terratemblor, huesomerang, bombaLodo, 
  rocaAfilada, avalancha, Pedrada, poderPasado,
  cabezaDeHierro, disparoEspejo, garraMetal, colaFerrea,
  psiquico, psicoCorte, hipnosis, cabezazoZen,
  pulsoDragon, danzaDragon, garraDragon, dragoaliento,
  brilloMagico, besoDrenaje, carantonia, ojitosTiernos,
  juegoSucio, mordisco, afilaGarras, pulsoSombrio,
  bolaSombra, punioSombra, impresionar, sombraVil,
  martilloHielo, nievePolvo, ventisca, colmilloHielo,
  fuerzaBruta, golpeRoca, demolicion, doblePatada,
  aireAfilado, acrobata, respiro, tornado,
  tijeraX, picadura, chupavidas, corteFuria,
  puyaNociva, milpuastoxicas, toxico, colmilloVeneno,
];

final List<Color> colores = [
  Colors.yellow,
  Colors.blue,
  Colors.orange,
  Colors.green,
  Colors.brown,
  Colors.grey,
  Colors.deepPurple,
  Colors.blueAccent,
  Colors.purple,
  Colors.lightBlue,
  Colors.pinkAccent,
  Colors.black,
  Colors.green,
  Colors.blueAccent,
  Colors.lightBlueAccent,
  Colors.greenAccent,
  Colors.cyanAccent,
  Colors.deepPurple,
];

class VentanaTablaAtaques extends StatefulWidget{
  final bool musica;

  const VentanaTablaAtaques({super.key, required this.musica});

  @override
  State<VentanaTablaAtaques> createState() => VentanaTablaAtaquesDinamica();
}

class VentanaTablaAtaquesDinamica extends State<VentanaTablaAtaques>{

  @override
  void initState(){
    super.initState();

    if(widget.musica){
      Musica().activarMusicaMenu();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(70),

        child: AppBar(
          toolbarHeight: 70,
         title: Text(
          'Tabla de ataques',
          style: GoogleFonts.pressStart2p( 
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold, 
          ),
        ),
          backgroundColor: const Color.fromARGB(255, 78, 113, 210),
          elevation: 20,
          shadowColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          
        ),
      ),
      body: SingleChildScrollView(
        child: Table(

        columnWidths: const {
          0: FlexColumnWidth(3), 
          1: FlexColumnWidth(1.5), 
          2: FlexColumnWidth(1.5), 
          3: FlexColumnWidth(2.5), 
        },
        border: TableBorder.all(color: Colors.grey, width: 1.0),

        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.blueAccent),
            children: [
              Center(child: Text('Ataque', style: GoogleFonts.pressStart2p(fontWeight: FontWeight.bold, fontSize: 16))),
              Center(child: Text('Potencia', style: GoogleFonts.pressStart2p(fontWeight: FontWeight.bold, fontSize: 16))),
              Center(child: Text('Clase', style: GoogleFonts.pressStart2p(fontWeight: FontWeight.bold, fontSize: 16))),
              Center(child: Text('Efecto', style: GoogleFonts.pressStart2p(fontWeight: FontWeight.bold, fontSize: 16))),
            ],
          ),
          ...todosLosAtaques.asMap().entries.map((entry) {
            final int index = entry.key; 
            final Ataque ataque = entry.value;
            final int bloqueIndex = (index ~/ 4);
            
            final Color colorFondo = colores[bloqueIndex % colores.length].withOpacity(0.3);

            String getEfecto(Ataque at) { return at.estadoSecundario ?? '—'; }
            
            return TableRow(
              decoration: BoxDecoration(
                color: colorFondo, 
              ),
              
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(ataque.nombre, style: GoogleFonts.pressStart2p(fontSize: 14)),
                  ),
                ),
                Center(child: Text(ataque.potencia.toString(), style: GoogleFonts.pressStart2p(fontSize: 14))),
                Center(child: Text(ataque.clase, style: GoogleFonts.pressStart2p(fontSize: 14))), 
                Center(
                  child: Text(
                    getEfecto(ataque),
                    style: GoogleFonts.pressStart2p(fontSize: 14),
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      )
      ),
    );
  }
}