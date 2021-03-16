import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class onmusic extends StatefulWidget {
  @override
  _onmusicState createState() => _onmusicState();
}

class _onmusicState extends State<onmusic> with SingleTickerProviderStateMixin {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localfilepath;
  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget picture(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.height / 3.5,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.6),
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(6, 2)),
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.9),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(-6, -2),
            )
          ],
          border: Border.all(color: Colors.grey[300], width: 3),
          borderRadius: BorderRadius.circular(300.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/sugar.jpg",
            ),
          )),
    );
  }

  Widget songName() {
    return Column(
      children: <Widget>[
        Text(
          'DHARIA - Sugar & Brownies',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }

  Widget _btn() {
    return ButtonTheme(
      minWidth: 48.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.swap_horiz),
              iconSize: 30,
              onPressed: () => advancedPlayer.pause()),
          IconButton(
              icon: Icon(Icons.pause_circle_filled),
              iconSize: 30,
              onPressed: () => advancedPlayer.pause()),
          IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 50,
              onPressed: () => audioCache.play("Brownies.mp3")),
          IconButton(
              icon: Icon(Icons.stop),
              iconSize: 30,
              onPressed: () => advancedPlayer.stop()),
          IconButton(
              icon: Icon(Icons.favorite_border),
              iconSize: 30,
              onPressed: () => advancedPlayer.stop()),
        ],
      ),
    );
  }

  Widget songTime() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("0.01"),
          ),
          Expanded(
            child: Text(
              "3.32",
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.cyan[200],
      inactiveColor: Colors.black,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          seekToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  Widget localAudio() {
    return _tab([
      songName(),
      picture(context),
      SizedBox(height: 10),
      slider(),
      songTime(),
      _btn(),

      //slider()
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[localAudio()],
        ),
      ),
    );
  }
}
