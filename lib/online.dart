import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: camel_case_types
class onvideo extends StatefulWidget {
  @override
  _onvideoState createState() => _onvideoState();
}

// ignore: camel_case_types
class _onvideoState extends State<onvideo> {
  String videurl = "https://youtu.be/jzD_yyEcp0M";
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videurl),
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        SizedBox(height: 70),
        SizedBox(height: 70),
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
        ),
        Text(
          'Marshmello & Anne-Marie - FRIENDS ',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ]),

      //debugShowCheckedModeBanner: false,
    );
  }
}
