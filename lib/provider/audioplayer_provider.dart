import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../services/firebase_services.dart';

class AudioProvider extends ChangeNotifier {
  final audioPlayer = AudioPlayer();
  final _services = FirebaseServices();
  final user = User;

  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  Duration duration = const Duration();
  Duration position = const Duration();

  double volume = 0.5;
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void initPlayer() {
    audioPlayer.onDurationChanged.listen((d) {
      duration = d;
    });
    audioPlayer.onPositionChanged.listen((p) {
      position = p;
    });
  }

  void play(Source source) async {
    var result = await audioPlayer.play(source);
  
  }

  void pause() async {
    await audioPlayer.pause();
  }

  void stop() async {
    await audioPlayer.stop();
  }

  void seek(double value) async {
    await audioPlayer.seek(Duration(seconds: value.toInt()));
  }

  void setVolume() async {
    await audioPlayer.setVolume(volume);
  }

  void onStateChanged() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      switch (state) {
        case PlayerState.playing:
          debugPrint('audio is playing');
          break;
        case PlayerState.paused:
          debugPrint('audio is paused');
          break;
        case PlayerState.stopped:
          debugPrint('audio is stopped');
          break;
        case PlayerState.completed:
          debugPrint('audio is completed');
          break;
        default:
      }
    });
  }
}
