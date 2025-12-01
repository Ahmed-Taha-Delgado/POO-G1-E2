class Ataque {
  final String nombre;
  final String tipo;
  int potencia;
  final int prioridad;
  final String clase; 

  final String? estadoSecundario;     
  final double? probabilidadEstado;  

  Ataque({
    required this.nombre,
    required this.tipo,
    required this.potencia,
    required this.prioridad,
    required this.clase,
    this.estadoSecundario,
    this.probabilidadEstado,
  });
}

class AtaqueFuego extends Ataque {
  AtaqueFuego({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Fuego',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueHierba extends Ataque {
  AtaqueHierba({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Hierba',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueNormal extends Ataque {
  AtaqueNormal({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Normal',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueElectrico extends Ataque {
  AtaqueElectrico({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Electrico',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueAgua extends Ataque {
  AtaqueAgua({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Agua',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueTierra extends Ataque {
  AtaqueTierra({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Tierra',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueRoca extends Ataque {
  AtaqueRoca({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Roca',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueAcero extends Ataque {
  AtaqueAcero({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Acero',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaquePsiquico extends Ataque {
  AtaquePsiquico({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Psiquico',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueDragon extends Ataque {
  AtaqueDragon({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Dragon',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueHada extends Ataque {
  AtaqueHada({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Hada',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueSiniestro extends Ataque {
  AtaqueSiniestro({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Siniestro',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueFantasma extends Ataque {
  AtaqueFantasma({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Fantasma',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueHielo extends Ataque {
  AtaqueHielo({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Hielo',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueLucha extends Ataque {
  AtaqueLucha({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Lucha',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueVolador extends Ataque {
  AtaqueVolador({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Volador',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueBicho extends Ataque {
  AtaqueBicho({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Bicho',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}

class AtaqueVeneno extends Ataque {
  AtaqueVeneno({
    required String nombre,
    required int potencia,
    required int prioridad,
    required String clase,
    String? estadoSecundario,
    double? probabilidadEstado,
  }) : super(
          nombre: nombre,
          tipo: 'Veneno',
          potencia: potencia,
          prioridad: prioridad,
          clase: clase,
          estadoSecundario: estadoSecundario,
          probabilidadEstado: probabilidadEstado,
        );
}
