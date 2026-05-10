import 'package:flutter/material.dart';

class VideoHome extends StatelessWidget {
  const VideoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Videos"),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          "Video Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
