      import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youchannel extends StatefulWidget {
  const Youchannel({super.key});

  @override
  State<Youchannel> createState() => _YouchannelState();
}

  late YoutubePlayerController controller;
  bool isLoading = true;

  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: 'https://api.themoviedb.org/3/movie/1290287/videos?api_key=0af5969626ba8ed48777835b264e4fb8',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
  }

class _YouchannelState extends State<Youchannel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(controller: controller, 
      showVideoProgressIndicator: true, 
      progressIndicatorColor: Colors.white,
      ),
    );
  }
}