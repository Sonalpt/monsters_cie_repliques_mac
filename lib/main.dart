// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'widgets/app_bar.dart';
import './widgets/replique_widget.dart';
import './screens/search_screen.dart';
import "./screens/favorites_screen.dart";
import './replique_data.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MonstresCieRepliquesApp());
}

class MonstresCieRepliquesApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MonstresCieRepliquesAppState();
  }
}

class _MonstresCieRepliquesAppState extends State<MonstresCieRepliquesApp> {
  late ChewieController _chewieController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController:
          VideoPlayerController.asset('assets/videos/monsters_inc_opening.mp4'),
      autoInitialize: true,
      looping: false,
      showControls: true,
      autoPlay: false,
    );
  }

  Future<void> _initializeVideoPlayer() async {
    final videoPlayerController =
        VideoPlayerController.asset('assets/videos/monsters_inc_opening.mp4');
    await videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      showControlsOnInitialize: false,
      autoInitialize: true,
      placeholder: Container(
        color: Colors.black,
      ),
      aspectRatio: videoPlayerController.value.aspectRatio,
      materialProgressColors: ChewieProgressColors(
        playedColor: Color(0xFF50CEFF),
        handleColor: Color(0xFF50CEFF),
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white,
      ),

      // onVideoEnd: () {
      //   setState(() {
      //     _isPlaying = false;
      //   });
      // },
    );
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
    setState(() {
      _isPlaying = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Color(0xFF1B032C),
          extendBody: true,
          appBar: myAppBar(
            context,
    onTapAction: (destinationPage) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationPage),
      );
    },
  ),

          body: Center(
            child: _isPlaying
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFB38DFF).withOpacity(1),
                              blurRadius: 8,
                              offset: Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFB38DFF),
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/monsters_inc_opening.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Chewie(
                        controller: _chewieController,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          _initializeVideoPlayer();
                          setState(() {
                            _isPlaying = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFB38DFF).withOpacity(1),
                                blurRadius: 8,
                                offset: Offset(0, 1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xFFB38DFF),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/monsters_inc_opening.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.play_circle_filled,
                                    size: 50,
                                    color: Color(0xFF50CEFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Expanded(
                        child: ListView.builder(
                          itemCount: repliques.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                RepliqueWidget(
                                  backgroundColor:
                                      repliques[index].backgroundColor,
                                  shadowColor: repliques[index].shadowColor,
                                  imageAssetPath:
                                      repliques[index].imageAssetPath,
                                  nomPersonnage: repliques[index].nomPersonnage,
                                  texteReplique: repliques[index].texteReplique,
                                  audio: repliques[index].audio,
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
