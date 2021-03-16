import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: camel_case_types
class video extends StatefulWidget {
  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.asset("assets/videos/bru1.mp4")
        ..addListener(listener)
        ..seekTo(Duration(seconds: 1))
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            child: (playerController == null
                ? Container()
                : VideoPlayer(
                    playerController,
                  )),
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createVideo();
            playerController.play();
          },
          child: Icon(
            Icons.play_arrow,
            color: Colors.amber,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
