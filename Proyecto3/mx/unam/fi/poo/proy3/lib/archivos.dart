import 'dart:io';
import 'package:path_provider/path_provider.dart';

File archivo = File('');
List<int> niveles = [];


Future<void> crearArchivo() async{
    final ruta = await getApplicationCacheDirectory();

    archivo = File('${ruta.path}/niveles.txt');

    print("UBICACIÓN DEL ARCHIVO: ${archivo.path}");

    try{
        await archivo.create(exclusive: true);
        for(int i=0; i<18; i++){
            archivo.writeAsStringSync('1 \n', mode: FileMode.append);
        }
    } catch (e){
    }
}

Future<void> leerArchivo() async{
    try{
        List<String> lineas = await archivo.readAsLines();

        niveles.clear();

        for(String linea in lineas){
            niveles.add(int.parse(linea.trim()));
        }

    }catch(e){
    }
}

Future<void> sobreEscribir() async{
    archivo.writeAsStringSync(niveles.join('\n'));
}