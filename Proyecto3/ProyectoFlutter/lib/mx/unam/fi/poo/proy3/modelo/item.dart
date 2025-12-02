import 'pokemon.dart';

abstract class Item {
    final String nombre;
    final String descripcion;

    Item({
        required this.nombre,
        required this.descripcion,
        });

    void usar(Pokemon pokemon);

}