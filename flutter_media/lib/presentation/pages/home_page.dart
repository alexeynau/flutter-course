import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoApp());

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/demo_video.mp4')
      ..initialize().then((_) {
        _controller.seekTo(Duration.zero);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: Row(
          children: [
            // back
            FloatingActionButton(
              onPressed: () async {
                _controller.seekTo((await _controller.position)! -
                    const Duration(seconds: 10));
              },
              child: const Icon(Icons.replay_10_sharp),
            ),

            // Play / resume
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
            // forward
            FloatingActionButton(
              onPressed: () {
                goForwardTo10Sec();
              },
              child: const Icon(Icons.forward_10_sharp),
            ),
          ],
        ),
      ),
    );
  }

  Future goBackTo10Sec() async =>
      goToPos((currentPosition) => currentPosition! - Duration(seconds: 10));
  Future goForwardTo10Sec() async =>
      goToPos((currentPosition) => currentPosition! + Duration(seconds: 10));

  Future goToPos(
    Duration Function(Duration? currentPosition) builder,
  ) async {
    final currentPosition = await _controller.position;
    final newPosition = builder(currentPosition);
    await _controller.seekTo(newPosition);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
