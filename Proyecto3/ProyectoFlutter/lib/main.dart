import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'dart:io';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/vista/vista.dart';
import 'package:pokemonpoo/mx/unam/fi/poo/proy3/modelo/modelo.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('POKEMON');
    setWindowMinSize(const Size(1280, 720));
    setWindowMaxSize(const Size(1280, 720));
    setWindowFrame(const Rect.fromLTWH(100, 100, 800, 600));
  }

  WidgetsFlutterBinding.ensureInitialized();

  await crearArchivo(); 
  await leerArchivo();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon',
      theme: ThemeData(primarySwatch: Colors.red),

      home: MenuPrincipal(), 
    );
  }
}