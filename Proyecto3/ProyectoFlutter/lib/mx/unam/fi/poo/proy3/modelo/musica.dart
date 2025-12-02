import 'package:audioplayers/audioplayers.dart';

class Musica {
  static final Musica _instance = Musica._internal();
  final reproductor = AudioPlayer();

  bool estaSonando = false;

  factory Musica() {
    return _instance;
  }

  Musica._internal();

  Future<void> activarMusicaMenu() async {
    try{
      await reproductor.stop();
      reproductor.setReleaseMode(ReleaseMode.loop);
      await reproductor.play(AssetSource('Musica/Menu.mp3'), volume: 0.1);
      estaSonando = true;
    }catch(e){
      print("Error al reproducir la música");
      estaSonando = false;
    }
      
  }

  Future<void> musicaBatalla() async {
    try{
      await reproductor.stop();
      reproductor.setReleaseMode(ReleaseMode.loop);
      await reproductor.play(AssetSource('Musica/Batalla.mp3'), volume: 0.1);
      estaSonando = true;
    }catch(e){
      print("Error al reproducir la música");
      estaSonando = false;
    }
  }

  Future<void> musicaVictoria() async {
    try{
      await reproductor.stop();
      reproductor.setReleaseMode(ReleaseMode.loop);
      await reproductor.play(AssetSource('Musica/Final.mp3'), volume: 0.1);
      estaSonando = true;
    }catch(e){
      print("Error al reproducir la música");
      estaSonando = false;
    }
  }

  Future<void> stop() async {
    await reproductor.stop();
    estaSonando = false;
  }
}