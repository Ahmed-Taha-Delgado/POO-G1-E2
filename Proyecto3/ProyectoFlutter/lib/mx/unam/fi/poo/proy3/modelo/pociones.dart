import 'item.dart';
import 'pokemon.dart';

class Pocion extends Item{

    double vidaMaxima;

    Pocion({required this.vidaMaxima})
    : super(nombre: "Poción", descripcion: "Cura 20 de vida");

    int cantidad = 20;

    @override
    void usar(Pokemon pokemon){
        if(pokemon.vida + cantidad > vidaMaxima){
            pokemon.vida = vidaMaxima;
        }else{
            pokemon.vida += cantidad;
        }
    } 
}

class PocionQuitarQuem extends Item{

    PocionQuitarQuem(): super(nombre: "Anti Quemadura", descripcion: "Quita el efecto de quemadura");
  
    @override
    void usar(Pokemon pokemon){
      if(pokemon.quem){
        pokemon.quem = false;
      }
    }
}
class PocionQuitarEnven extends Item{

    PocionQuitarEnven(): super(nombre: "Anti Envenenamiento", descripcion: "Quita el efecto de envenenamiento");
  
    @override
    void usar(Pokemon pokemon){
      if(pokemon.env){
        pokemon.env = false;
      }
    }
}

class PocionQuitarCong extends Item{

    PocionQuitarCong(): super(nombre: "Anti Congelación", descripcion: "Quita el efecto de congelamiento");
  
    @override
    void usar(Pokemon pokemon){
      if(pokemon.congelado){
        pokemon.congelado = false;
      }
    }
}

class PocionQuitarPar extends Item{

    PocionQuitarPar(): super(nombre: "Anti Paralisis", descripcion: "Quita el efecto de Paralisis");
  
    @override
    void usar(Pokemon pokemon){
      if(pokemon.paralizado){
        pokemon.paralizado = false;
        pokemon.velocidad = pokemon.velocidad*2;
      }
    }
}
class PocionDespertar extends Item{

    PocionDespertar(): super(nombre: "Despertar", descripcion: "Despierta al pokemon");
  
    @override
    void usar(Pokemon pokemon){
      if(pokemon.suenio){
        pokemon.suenio = false;
      }
    }
}

