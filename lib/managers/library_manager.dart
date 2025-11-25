import 'package:file_picker/file_picker.dart';
import '../models/song.dart';

class LibraryManager {
  List<Song> songs = [];

  Future<void> pickSongs() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result != null) {
      songs.addAll(result.files
          .map((file) => Song(path: file.path!, title: file.name)));
    }
  }
}
