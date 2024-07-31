import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class AudioPlayService {
  static Future<void> playSound(String url) async {
    AudioPlayer player = AudioPlayer();
    await player.play(AssetSource(url));
  }
}
