// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerScreen extends StatefulWidget {
  final String trailerUrl;
  final String title;
  TrailerScreen({super.key, required this.trailerUrl, required this.title});

  @override
  State<TrailerScreen> createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.trailerUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trailer Screen"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
          // url: widget.trailerUrl,
          // withZoom: false,
          // withJavascript: true,
          // withLocalStorage: true,
          // hidden: true,
          Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => print('Player is ready.'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 24, fontFamily: 'poppins'),
          ),
        ],
      ),
    );
  }
}
