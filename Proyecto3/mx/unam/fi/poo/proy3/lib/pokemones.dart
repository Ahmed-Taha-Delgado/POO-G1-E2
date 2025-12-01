import 'pokemon.dart';
import 'ataques.dart';
import 'archivos.dart';

class PokemonFuego extends Pokemon {
  PokemonFuego()
      : super(nombre: 'Charmander', nivel: niveles[2], tipo: 'Fuego', rutaA: 'assets/Gifs/FuegoA.gif', rutaB: 'assets/Gifs/FuegoB.gif', ataques: [llamarada, ascuas, nitrocarga, corte]);
} 

class PokemonHierba extends Pokemon {
  PokemonHierba()
      : super(nombre: 'Sceptile', nivel: niveles[3], tipo: 'Hierba', rutaA: 'assets/Gifs/HierbaA.gif', rutaB: 'assets/Gifs/HierbaB.gif', ataques: [latigazo, brazopincho, hojaafilada, votoplanta]);
}

class PokemonNormal extends Pokemon {
  PokemonNormal()
      : super(nombre: 'Eevee', nivel: niveles[4], tipo: 'Normal', rutaA: 'assets/Gifs/NormalA.gif', rutaB: 'assets/Gifs/NormalB.gif', ataques: [alboroto, araniazo, atizar, corte]);
}

class PokemonElectrico extends Pokemon {
  PokemonElectrico()
      : super(nombre: 'Pikachu', nivel: niveles[0], tipo: 'Electrico', rutaA: 'assets/Gifs/ElectricoA.gif', rutaB: 'assets/Gifs/ElectricoB.gif', ataques: [rayo, ondaTrueno, impactoTrueno, ataqueRapido]);
}

class PokemonAgua extends Pokemon {
  PokemonAgua()
      : super(nombre: 'Blastoise', nivel: niveles[1], tipo: 'Agua', rutaA: 'assets/Gifs/AguaA.gif', rutaB: 'assets/Gifs/AguaB.gif', ataques: [hidroBomba, escaldar, acuajet, surf]);
}

class PokemonTierra extends Pokemon {
  PokemonTierra()
      : super(nombre: 'Marowak', nivel: niveles[5], tipo: 'Tierra', rutaA: 'assets/Gifs/TierraA.gif', rutaB: 'assets/Gifs/TierraB.gif', ataques: [terremoto, terratemblor, huesomerang,bombaLodo]);
}

class PokemonRoca extends Pokemon {
  PokemonRoca()
      : super(nombre: 'Gigalith', nivel: niveles[6], tipo: 'Roca', rutaA: 'assets/Gifs/RocaA.gif', rutaB: 'assets/Gifs/RocaB.gif', ataques: [poderPasado, rocaAfilada, terremoto, avalancha]);
}

class PokemonAcero extends Pokemon {
  PokemonAcero()
      : super(nombre: 'Melmetal', nivel: niveles[7], tipo: 'Acero', rutaA: 'assets/Gifs/MetalA.gif', rutaB: 'assets/Gifs/MetalB.gif', ataques: [garraMetal, cabezaDeHierro, colaFerrea, disparoEspejo]);
}

class PokemonPsiquico extends Pokemon {
  PokemonPsiquico()
      : super(nombre: 'Mewtwo', nivel: niveles[8], tipo: 'Psiquico', rutaA: 'assets/Gifs/PsiquicoA.gif', rutaB: 'assets/Gifs/PsiquicoB.gif', ataques: [cabezazoZen, psiquico, psicoCorte, hipnosis]);
}

class PokemonDragon extends Pokemon {
  PokemonDragon()
      : super(nombre: 'Dragonair', nivel: niveles[9], tipo: 'Dragon', rutaA: 'assets/Gifs/DragonA.gif', rutaB: 'assets/Gifs/DragonB.gif', ataques: [dragoaliento, garraDragon, avalancha, pulsoDragon]);
}

class PokemonHada extends Pokemon {
  PokemonHada( )
      : super(nombre: 'Clefairy', nivel: niveles[10], tipo: 'Hada', rutaA: 'assets/Gifs/HadaA.gif', rutaB: 'assets/Gifs/HadaB.gif', ataques:[brilloMagico, besoDrenaje, carantonia, ojitosTiernos] );
}

class PokemonSiniestro extends Pokemon {
  PokemonSiniestro()
      : super(nombre: 'Umbreon', nivel: niveles[11], tipo: 'Siniestro', rutaA: 'assets/Gifs/SiniestroA.gif', rutaB: 'assets/Gifs/SiniestroB.gif', ataques:[juegoSucio, mordisco, afilaGarras, pulsoSombrio]);
}

class PokemonFantasma extends Pokemon {
  PokemonFantasma()
      : super(nombre: 'Cofagrigus', nivel: niveles[12], tipo: 'Fantasma', rutaA: 'assets/Gifs/FantasmaA.gif', rutaB: 'assets/Gifs/FantasmaB.gif', ataques:[bolaSombra, punioSombra, impresionar, sombraVil]);
}

class PokemonHielo extends Pokemon {
  PokemonHielo()
      : super(nombre: 'Beartic', nivel: niveles[13], tipo: 'Hielo', rutaA: 'assets/Gifs/HieloA.gif', rutaB: 'assets/Gifs/HieloB.gif', ataques: [martilloHielo, ventisca, colmilloHielo, nievePolvo] );
}

class PokemonLucha extends Pokemon {
  PokemonLucha()
      : super(nombre: 'Machamp', nivel: niveles[14], tipo: 'Lucha', rutaA: 'assets/Gifs/LuchaA.gif', rutaB: 'assets/Gifs/LuchaB.gif', ataques: [fuerzaBruta, golpeRoca, demolicion, doblePatada]);
}

class PokemonVolador extends Pokemon {
  PokemonVolador()
      : super(nombre: 'Tornadus', nivel: niveles[15], tipo: 'Volador', rutaA: 'assets/Gifs/VoladorA.gif', rutaB: 'assets/Gifs/VoladorB.gif', ataques: [acrobata, aireAfilado, tornado, respiro]);
}

class PokemonBicho extends Pokemon {
  PokemonBicho()
      : super(nombre: 'Accelgor', nivel: niveles[16], tipo: 'Bicho', rutaA: 'assets/Gifs/BichoA.gif', rutaB: 'assets/Gifs/BichoB.gif', ataques: [tijeraX, picadura, chupavidas, corteFuria]);
}

class PokemonVeneno extends Pokemon {
  PokemonVeneno()
      : super(nombre: 'Weezeing', nivel: niveles[17], tipo: 'Veneno', rutaA: 'assets/Gifs/VenenoA.gif', rutaB: 'assets/Gifs/VenenoB.gif', ataques: [puyaNociva, colmilloVeneno, milpuastoxicas, toxico]);
}