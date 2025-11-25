import 'package:flutter/material.dart';
import '../models/song.dart';
import '../managers/audio_manager.dart';

class PlayerScreen extends StatefulWidget {
  final Song song;
  const PlayerScreen({super.key, required this.song});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioManager audioManager = AudioManager();

  @override
  void initState() {
    super.initState();
    audioManager.playSong(widget.song);
  }

  @override
  void dispose() {
    audioManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.song.title)),
      body: Center(
        child: IconButton(
          icon: Icon(audioManager.isPlaying ? Icons.pause : Icons.play_arrow),
          iconSize: 64,
          onPressed: () {
            if (audioManager.isPlaying) {
              audioManager.pause();
            } else {
              audioManager.playSong(widget.song);
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}
