import 'ataque.dart';

final llamarada = AtaqueFuego(nombre:'Llamarada', potencia: 110, clase:'Especial',prioridad: 0);
final nitrocarga = AtaqueFuego(nombre: 'Nitrocarga', potencia: 50, clase:'Fisico',prioridad: 0);
final ascuas= AtaqueFuego(nombre: 'Ascuas', potencia: 40, clase:'Especial',prioridad: 0);//

final latigazo = AtaqueHierba(nombre: 'Latigazo', potencia: 120, clase:'Fisico',prioridad: 0);
final brazopincho = AtaqueHierba(nombre: 'Brazo pincho', potencia: 60, clase:'Fisico',prioridad: 0);
final hojaafilada = AtaqueHierba(nombre: 'Hoja afilada', potencia: 60, clase:'Fisico',prioridad: 0);
final votoplanta = AtaqueHierba(nombre: 'Voto planta', potencia: 50,  clase:'Especial',prioridad: 0);

final alboroto = AtaqueNormal(nombre: 'Alboroto', potencia: 90, clase:'Especial',prioridad: 0);
final araniazo = AtaqueNormal(nombre: 'Arañazo', potencia: 40, clase:'Fisico',prioridad: 0);
final atizar= AtaqueNormal(nombre: 'Atizar', potencia: 80, clase:'Fisico',prioridad: 0);
final corte = AtaqueNormal(nombre: 'Corte', potencia: 50, clase:'Fisico',prioridad: 0);
final ataqueRapido = AtaqueNormal(nombre: 'Ataque rapido', potencia: 40, clase:'Fisico',prioridad: 1);

final rayo = AtaqueElectrico(nombre: 'Rayo', potencia: 90, clase:'Especial',prioridad: 0);
final ondaTrueno= AtaqueElectrico(nombre: 'Ondatrueno', potencia: 0, clase:'Estado',prioridad: 0);
final impactoTrueno= AtaqueElectrico(nombre: 'Impactrueno', potencia: 80, clase:'Especial',prioridad: 0);//

final hidroBomba = AtaqueAgua(nombre: 'Hidro bomba', potencia: 110, clase:'Especial',prioridad: 0);
final surf = AtaqueAgua(nombre: 'Surf', potencia: 90, clase:'Especial',prioridad: 0);
final acuajet = AtaqueAgua(nombre: 'acuajet', potencia: 40, clase:'Fisico',prioridad: 1);
final escaldar = AtaqueAgua(nombre: 'Escaldar', potencia: 65, clase:'Especial',prioridad: 0);//

final terremoto = AtaqueTierra(nombre: 'Terremoto', potencia: 100, clase:'Fisico',prioridad: 0);
final terratemblor= AtaqueTierra(nombre: 'Terratemblor', potencia: 60, clase:'Fisico',prioridad: 0);//
final huesomerang= AtaqueTierra(nombre: 'Huesomerang', potencia: 50, clase:'Fisico',prioridad: 0);
final bombaLodo = AtaqueVeneno(nombre: 'Bomba Lodo', potencia: 65,clase:'Especial',prioridad: 0);//

final rocaAfilada = AtaqueRoca(nombre: 'Roca afilada', potencia: 100, clase:'Fisico',prioridad: 0);
final avalancha = AtaqueRoca(nombre: 'Avalancha', potencia: 75, clase:'Fisico',prioridad: 0);//
final trampaRocas= AtaqueRoca(nombre: 'Trampa rocas', potencia: 0, clase:'Estado',prioridad: 0);//
final poderPasado= AtaqueRoca(nombre: 'Poder pasado', potencia: 60, clase:'Especial',prioridad: 0);//

final cabezaDeHierro = AtaqueAcero(nombre: 'Cabeza de hierro', potencia: 80, clase:'Fisico',prioridad: 0);
final defensaFerrea= AtaqueAcero(nombre: 'Defensa ferrea', potencia: 0, clase:'Estado',prioridad: 0);//
final garraMetal= AtaqueAcero(nombre: 'Garra metal', potencia: 70, clase:'Fisico',prioridad: 0);//
final canionResplandor= AtaqueAcero(nombre: 'Cañon resplandor', potencia: 80, clase:'Especial',prioridad: 0);//

final psiquico = AtaquePsiquico(nombre: 'Psiquico', potencia: 90, clase:'Especial',prioridad: 0);//
final psicoCorte = AtaquePsiquico(nombre: 'Psico corte', potencia: 70, clase:'Fisico',prioridad: 0);
final hipnosis= AtaquePsiquico(nombre: 'Hipnosis', potencia: 0, clase:'Estado',prioridad: 0);//
final cabezazoZen= AtaquePsiquico(nombre: 'Cabezazo zen', potencia: 80, clase:'Fisico',prioridad: 0);

final pulsoDragon = AtaqueDragon(nombre: 'Pulso dragon', potencia: 85, clase:'Especial',prioridad: 0);
final danzaDragon = AtaqueDragon(nombre: 'Danza dragon', potencia: 0, clase:'Estado',prioridad: 0);//
final garraDragon = AtaqueDragon(nombre: 'Garra dragon', potencia: 80, clase:'Fisico',prioridad: 0);
final dragoaliento = AtaqueDragon(nombre: 'Dragoaliento', potencia: 60, clase:'Fisico',prioridad: 0);

final brilloMagico = AtaqueHada(nombre: 'Brillo magico', potencia: 80, clase:'Especial',prioridad: 0);
final besoDrenaje = AtaqueHada(nombre: 'Beso drenaje', potencia: 50, clase:'Especial',prioridad: 0);//
final carantonia= AtaqueHada(nombre: 'Carantonia', potencia: 0, clase:'Estado',prioridad: 0);//
final ojitosTiernos= AtaqueHada(nombre: 'Ojitos tiernos', potencia: 0, clase:'Estado',prioridad: 1);//

final juegoSucio = AtaqueSiniestro(nombre: 'Juego sucio', potencia: 95, clase:'Fisico',prioridad: 0);
final mordisco = AtaqueSiniestro(nombre: 'Mordisco', potencia: 60, clase:'Fisico',prioridad: 0);
final afilaGarras = AtaqueSiniestro(nombre: 'Afila garras', potencia: 0, clase:'Estado',prioridad: 0);//
final golpeOscuro= AtaqueSiniestro(nombre: 'Golpe oscuro', potencia: 80, clase:'Fisico',prioridad: 0);//

final bolaSombra = AtaqueFantasma(nombre: 'Bola sombra', potencia: 80,  clase:'Especial',prioridad: 0);//
final punioSombra = AtaqueFantasma(nombre: 'Puño sombra', potencia: 60, clase:'Fisico',prioridad: 0);
final impresionar= AtaqueFantasma(nombre: 'Impresionar', potencia: 30, clase:'Fisico',prioridad: 1);//
final sombraVil= AtaqueFantasma(nombre: 'Sombra vil', potencia: 40, clase:'Estado',prioridad: 1);//

final martilloHielo = AtaqueHielo(nombre: 'Martillo hielo', potencia: 100, clase:'',prioridad: 0);
final nievePolvo = AtaqueHielo(nombre: 'Nieve polvi', potencia: 40,clase:'',prioridad: 0);//
final ventisca = AtaqueHielo(nombre: 'Ventisca', potencia: 110, clase:'Especial',prioridad: 0);//
final colmilloHielo= AtaqueHielo(nombre: 'Colmillo hielo', potencia: 65, clase:'Fisico',prioridad: 0);

final fuerzaBruta = AtaqueLucha(nombre: 'Fuerza bruta', potencia: 120, clase:'Fisico',prioridad: 0);//
final golpeRoca= AtaqueLucha(nombre: 'Golpe roca', potencia: 75, clase:'Fisico',prioridad: 0);//
final demolicion= AtaqueLucha(nombre: 'Demolicion', potencia: 60, clase:'Fisico',prioridad: 0);
final doblePatada= AtaqueLucha(nombre: 'Doble patada', potencia: 30, clase:'Fisico',prioridad: 0);

final aireAfilado = AtaqueVolador(nombre: 'Aire afilado', potencia: 60, clase:'Especial',prioridad: 0);
final acrobata= AtaqueVolador(nombre: 'Acrobata', potencia: 55, clase:'Fisico',prioridad: 0);
final respiro= AtaqueVolador(nombre: 'Respiro', potencia: 0, clase:'Estado',prioridad: 0);
final tornado= AtaqueVolador(nombre: 'Tornado', potencia: 40, clase:'Especial',prioridad: 0);

final tijeraX = AtaqueBicho(nombre: 'Tijera X', potencia: 80, clase:'Fisico',prioridad: 0);
final picadura = AtaqueBicho(nombre: 'Picadura', potencia: 60, clase:'Fisico',prioridad: 0);
final chupavidas= AtaqueBicho(nombre: 'Chupavidas', potencia: 80, clase:'Fisico',prioridad: 0);//
final corteFuria= AtaqueBicho(nombre: 'Corte furia', potencia: 40, clase:'Fisico',prioridad: 0);

final puyaNociva = AtaqueVeneno(nombre: 'Puya nociva', potencia: 80, clase:'Fisico',prioridad: 0);//
final milpuastoxicas= AtaqueVeneno(nombre: 'Mil puas toxicas', potencia: 70, clase:'Fisico',prioridad: 0);//
final toxico= AtaqueVeneno(nombre: 'Toxico', potencia: 0, clase:'Estado',prioridad: 0);//
final colmilloVeneno= AtaqueVeneno(nombre: 'Colmillo veneno', potencia: 65, clase:'Fisico',prioridad: 0);

