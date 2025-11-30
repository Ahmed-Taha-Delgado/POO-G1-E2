import 'pokemon.dart';
import 'dart:math';
import 'ataques.dart';
import 'ataque.dart';

final Random _random = Random();


class PokemonFuego extends Pokemon {
  PokemonFuego({required String nombre, required int nivel})
      : super(nombre: 'Charmander', nivel:_random.nextInt(100)+1, tipo: 'Fuego'){

    ataques = [llamarada, ascuas, nitrocarga, corte];
  }
} 

class PokemonHierba extends Pokemon {
  PokemonHierba({required String nombre, required int nivel})
      : super(nombre: 'Sceptile', nivel:_random.nextInt(100)+1, tipo: 'Hierba'){

      ataques = [latigazo, brazopincho, hojaafilada, votoplanta];
    }
}

class PokemonNormal extends Pokemon {
  PokemonNormal({required String nombre, required int nivel})
      : super(nombre: 'Eevee', nivel:_random.nextInt(100)+1, tipo: 'Normal'){
      
      ataques = [alboroto, araniazo, atizar, corte];
    }
}

class PokemonElectrico extends Pokemon {
  PokemonElectrico({required String nombre, required int nivel})
      : super(nombre: 'Pikachu', nivel:_random.nextInt(100)+1, tipo: 'Electrico'){

        ataques = [rayo, ondaTrueno, impactoTrueno, ataqueRapido];
    } 
}

class PokemonAgua extends Pokemon {
  PokemonAgua({required String nombre, required int nivel})
      : super(nombre: 'Blastoise', nivel: _random.nextInt(100)+1, tipo: 'Agua'){
        
    }
}

class PokemonTierra extends Pokemon {
  PokemonTierra({required String nombre, required int nivel})
      : super(nombre: 'Marowak', nivel:_random.nextInt(100)+1, tipo: 'Tierra');
}

class PokemonRoca extends Pokemon {
  PokemonRoca({required String nombre, required int nivel})
      : super(nombre: 'Gigalith', nivel: _random.nextInt(100)+1, tipo: 'Roca');
}

class PokemonAcero extends Pokemon {
  PokemonAcero({required String nombre, required int nivel})
      : super(nombre: 'Melmetal', nivel: _random.nextInt(100)+1, tipo: 'Acero');
}

class PokemonPsiquico extends Pokemon {
  PokemonPsiquico({required String nombre, required int nivel})
      : super(nombre: 'Mewtwo', nivel: _random.nextInt(100)+1, tipo: 'Psiquico');
}

class PokemonDragon extends Pokemon {
  PokemonDragon({required String nombre, required int nivel})
      : super(nombre: 'Dragonair', nivel: _random.nextInt(100)+1, tipo: 'Dragon');
}

class PokemonHada extends Pokemon {
  PokemonHada({required String nombre, required int nivel})
      : super(nombre: 'Clefairy', nivel: _random.nextInt(100)+1, tipo: 'Hada');
}

class PokemonSiniestro extends Pokemon {
  PokemonSiniestro({required String nombre, required int nivel})
      : super(nombre: 'Umbreon', nivel: _random.nextInt(100)+1, tipo: 'Siniestro');
}

class PokemonFantasma extends Pokemon {
  PokemonFantasma({required String nombre, required int nivel})
      : super(nombre: 'Cofagrigus', nivel: _random.nextInt(100)+1, tipo: 'Fantasma');
}

class PokemonHielo extends Pokemon {
  PokemonHielo({required String nombre, required int nivel})
      : super(nombre: 'Beartic', nivel: _random.nextInt(100)+1, tipo: 'Hielo');
}

class PokemonLucha extends Pokemon {
  PokemonLucha({required String nombre, required int nivel})
      : super(nombre: 'Machamp', nivel: _random.nextInt(100)+1, tipo: 'Lucha');
}

class PokemonVolador extends Pokemon {
  PokemonVolador({required String nombre, required int nivel})
      : super(nombre: 'Tornadus', nivel: _random.nextInt(100)+1, tipo: 'Volador');
}

class PokemonBicho extends Pokemon {
  PokemonBicho({required String nombre, required int nivel})
      : super(nombre: 'Accelgor', nivel: _random.nextInt(100)+1, tipo: 'Bicho');
}

class PokemonVeneno extends Pokemon {
  PokemonVeneno({required String nombre, required int nivel})
      : super(nombre: 'Weezeing', nivel: _random.nextInt(100)+1, tipo: 'Veneno');
}