import 'package:flutter/material.dart';
import '../models/music_model.dart';
import '../widgets/music_tile.dart';
import 'music_player_screen.dart';

class MusicHome extends StatelessWidget {
  MusicHome({super.key});

  final List<MusicModel> musics = [
    MusicModel(
      title: "Dreams",
      artist: "Alan Walker",
      path: "assets/music/music1.mp3",
      image: "assets/images/music1.jpg",
    ),
    MusicModel(
      title: "Alone",
      artist: "Marshmello",
      path: "assets/music/music2.mp3",
      image: "assets/images/music2.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Music"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: musics.length,
        itemBuilder: (context, index) {
          return MusicTile(
            music: musics[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MusicPlayerScreen(
                    music: musics[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
