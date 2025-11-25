import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class AudioManager {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playSong(Song song) async {
    await _player.setFilePath(song.path);
    _player.play();
  }

  void pause() => _player.pause();
  void stop() => _player.stop();
  void dispose() => _player.dispose();

  bool get isPlaying => _player.playing;
}
