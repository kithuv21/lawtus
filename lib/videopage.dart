import 'package:flutter/material.dart';
import 'package:lawtus/chewie.dart';
import 'package:video_player/video_player.dart';

class videopage extends StatelessWidget {
  final String videourl;
  final String name;
  final String topic;
  const videopage({required this.name,required this.videourl,required this.topic, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              videoplayer(
                  videoplayercontroller: VideoPlayerController.networkUrl(Uri.parse(videourl)),
                  looping: true,
          
              ),
              SizedBox(height: 20,),
              Text(topic,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              SizedBox(height: 15,),
              Text(name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
              
            ],
          ),
        ),
      ),
    );
  }
}