import 'package:flutter/material.dart';
import '../models/song.dart';
import '../managers/audio_manager.dart';
import 'player_screen.dart';

class LibraryScreen extends StatelessWidget {
  final List<Song> songs;
  final AudioManager audioManager;

  const LibraryScreen({
    super.key,
    required this.songs,
    required this.audioManager,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: songs.isEmpty
          ? const Center(child: Text('No songs found. Add some!'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // two columns for tablet-friendly layout
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerScreen(song: song),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        song.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
