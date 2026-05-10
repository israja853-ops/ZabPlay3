import 'package:flutter/material.dart';
import '../models/video_model.dart';
import '../widgets/video_card.dart';
import 'video_player_screen.dart';

class VideoHome extends StatelessWidget {
  VideoHome({super.key});

  final List<VideoModel> videos = [
    VideoModel(
      title: "Nature 4K",
      path: "assets/videos/video1.mp4",
      thumbnail: "assets/images/thumb1.jpg",
      duration: Duration(minutes: 10),
    ),
    VideoModel(
      title: "Ocean View",
      path: "assets/videos/video2.mp4",
      thumbnail: "assets/images/thumb2.jpg",
      duration: Duration(minutes: 8),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Videos"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoCard(
            video: videos[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoPlayerScreen(
                    video: videos[index],
                    videos: videos,
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
