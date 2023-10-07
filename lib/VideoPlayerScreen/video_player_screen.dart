
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/VideoPlayerScreen/widgets/actions_section.dart';
import 'package:reddit_clone/VideoPlayerScreen/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';


class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late  VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/Realme11.mp4');
    _chewieController = ChewieController(

      videoPlayerController: _videoPlayerController,
      // showControls: false,
      showOptions: false,
      materialProgressColors: ChewieProgressColors(bufferedColor: Color.fromRGBO(149, 165, 166, 1),playedColor: Color.fromRGBO(255, 255, 255, 1)),
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Chewie(
              controller: _chewieController,
            ),
            CustomAppBar(),
            // Positioned(
            //
            //   child: IconButton(onPressed: (){
            //   _videoPlayerController.pause();
            //
            //
            // },icon:Icon(Icons.play_arrow), ),),
            ActionsSection(),
            Positioned(
              left: 20,
              bottom: 80,
              child: Container(
                width: size.width * .6,
                child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 13,backgroundColor: Colors.lightBlueAccent,),
                      SizedBox(width: 10,),
                      Text("ahmed25",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",maxLines: 3,overflow: TextOverflow.ellipsis,),

                ],
            ),
              ),),
          ],
        ),
      ),
    );
  }
}

