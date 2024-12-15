import 'package:audioplayers/audioplayers.dart';
import 'package:trpg_tool/common/config.dart';

class PlayAudio {
  final player = AudioPlayer();
  late Source source;

  void init(String path) {
    source = AssetSource(path);
  }

  Future<void> play() async {
    await player.play(source);
  }

  void setDiceAudio() {
    init(APPConfig.diceAudioPath);
  }
}
