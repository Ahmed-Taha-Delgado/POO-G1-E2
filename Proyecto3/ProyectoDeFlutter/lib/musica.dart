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
    await reproductor.stop();
    reproductor.setReleaseMode(ReleaseMode.loop);
    await reproductor.play(AssetSource('Musica/Menu.mp3'), volume: 0.1);
    estaSonando = true;
    
  }

  Future<void> musicaBatalla() async {
    await reproductor.stop();
    reproductor.setReleaseMode(ReleaseMode.loop);
    await reproductor.play(AssetSource('Musica/Batalla.mp3'), volume: 0.1);
    estaSonando = true;
  }

  Future<void> musicaVictoria() async {
    await reproductor.stop();
    reproductor.setReleaseMode(ReleaseMode.loop);
    await reproductor.play(AssetSource('Musica/Final.mp3'), volume: 0.1);
    estaSonando = true;
  }

  Future<void> stop() async {
    await reproductor.stop();
    estaSonando = false;
  }
}