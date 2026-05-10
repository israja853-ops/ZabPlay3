import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/video_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoModel video;
  final List<VideoModel> videos;

  const VideoPlayerScreen({
    super.key,
    required this.video,
    required this.videos,
  });

  @override
  State<VideoPlayerScreen> createState() =>
      _VideoPlayerScreenState();
}

class _VideoPlayerScreenState
    extends State<VideoPlayerScreen> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller =
        VideoPlayerController.asset(widget.video.path)
          ..initialize().then((_) {
            setState(() {});
            controller.play();
          });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: controller.value.isInitialized
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio:
                      controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      controller.value.isPlaying
                          ? controller.pause()
                          : controller.play();
                    });
                  },
                  icon: Icon(
                    controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.videos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(
                          widget.videos[index].thumbnail,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          widget.videos[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
