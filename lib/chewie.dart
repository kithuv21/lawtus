import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoplayer extends StatefulWidget {
  final VideoPlayerController videoplayercontroller;
  final bool looping;
  videoplayer({required this.videoplayercontroller,required this.looping,super.key});

  @override
  State<videoplayer> createState() => _videoplayerState();
}

class _videoplayerState extends State<videoplayer> {
  ChewieController ?chewieController;
  @override
  void initState(){
      chewieController=ChewieController(
      videoPlayerController: widget.videoplayercontroller,
      
      aspectRatio: 16/9,
      autoInitialize: true
    );
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
    widget.videoplayercontroller.dispose();
    chewieController!.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

      ),
      height: 300,

      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: Chewie(
            controller: chewieController!,
          
        ),
      ),
    );
  }
}