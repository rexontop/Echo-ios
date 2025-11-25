import 'package:flutter/material.dart';
import '../models/song.dart';
import '../managers/library_manager.dart';
import 'player_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LibraryManager libraryManager = LibraryManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Echo Flutter')),
      body: ListView.builder(
        itemCount: libraryManager.songs.length,
        itemBuilder: (context, index) {
          final song = libraryManager.songs[index];
          return ListTile(
            title: Text(song.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlayerScreen(song: song),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await libraryManager.pickSongs();
          setState(() {});
        },
        child: const Icon(Icons.library_music),
      ),
    );
  }
}
