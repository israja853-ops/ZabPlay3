import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/music_model.dart';
import '../widgets/neon_button.dart';

class MusicPlayerScreen extends StatefulWidget {
  final MusicModel music;

  const MusicPlayerScreen({
    super.key,
    required this.music,
  });

  @override
  State<MusicPlayerScreen> createState() =>
      _MusicPlayerScreenState();
}

class _MusicPlayerScreenState
    extends State<MusicPlayerScreen> {

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    player.setAsset(widget.music.path);
    player.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(20),
              child: Image.asset(
                widget.music.image,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.music.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.music.artist,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 40),
          NeonButton(
            icon:
                isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
            onTap: () {
              setState(() {
                if (isPlaying) {
                  player.pause();
                } else {
                  player.play();
                }

                isPlaying = !isPlaying;
              });
            },
          ),
        ],
      ),
    );
  }
}
