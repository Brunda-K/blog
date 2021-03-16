import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './music.dart';
import './online.dart';
import './offline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [
    Center(child: Text("Home")), //offlinemusic
    Center(child: onmusic()), //onlinemusic
    Center(child: video()), //offlinevideo
    Center(child: onvideo()), //onlineideo
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.cyan[200]));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(22.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Music",
                      hintStyle: TextStyle(color: Colors.black),
                      icon: Icon(Icons.search, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mic,
                          color: Colors.black,
                        ),
                      ),
                      VerticalDivider(color: Colors.black),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person_pin,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              title: Text('My Music'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.offline_pin),
              title: Text('My Video'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              title: Text('Online Video'),
              backgroundColor: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
