import 'package:flutter/material.dart';
import '../models/music_model.dart';

class MusicTile extends StatelessWidget {
  final MusicModel music;
  final VoidCallback onTap;

  const MusicTile({
    super.key,
    required this.music,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          music.image,
          width: 55,
          height: 55,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        music.title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        music.artist,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }
}
