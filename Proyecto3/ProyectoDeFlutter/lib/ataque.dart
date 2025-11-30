
class Ataque {
  final String nombre;
  final String tipo;
  final int potencia;
  final int prioridad;
  final String clase;

  Ataque({
    required this.nombre,
    required this.tipo,
    required this.potencia,
    required this.prioridad,
    required this.clase,
  });
}

class AtaqueFuego extends Ataque {
  AtaqueFuego({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Fuego',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueHierba extends Ataque {
  AtaqueHierba({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Hierba',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueNormal extends Ataque {
  AtaqueNormal({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Normal',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueElectrico extends Ataque {
  AtaqueElectrico({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Electrico',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueAgua extends Ataque {
  AtaqueAgua({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Agua',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueTierra extends Ataque {
  AtaqueTierra({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Tierra',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueRoca extends Ataque {
  AtaqueRoca({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Roca',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueAcero extends Ataque {
  AtaqueAcero({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Acero',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaquePsiquico extends Ataque {
  AtaquePsiquico({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Psiquico',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueDragon extends Ataque {
  AtaqueDragon({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Dragon',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueHada extends Ataque {
  AtaqueHada({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Hada',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueSiniestro extends Ataque {
  AtaqueSiniestro({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Siniestro',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueFantasma extends Ataque {
  AtaqueFantasma({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Fantasma',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueHielo extends Ataque {
  AtaqueHielo({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Hielo',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueLucha extends Ataque {
  AtaqueLucha({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Lucha',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueVolador extends Ataque {
  AtaqueVolador({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Volador',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueBicho extends Ataque {
  AtaqueBicho({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Bicho',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}

class AtaqueVeneno extends Ataque {
  AtaqueVeneno({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
  }) : super(
          nombre: nombre,
          tipo: 'Veneno',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
        );
}