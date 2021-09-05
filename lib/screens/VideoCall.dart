import 'package:better_player/better_player.dart';
import 'package:doctor_app/widgets/videoTab1.dart';
import 'package:doctor_app/widgets/videoTab2.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> with TickerProviderStateMixin {
  late TabController _controller;
  Color color1 = HexColor('#04C5C2');
  Color color2 = Colors.white;
  Color text1 = Colors.black;
  Color text2 = Colors.white;
  bool popUp = false;
  bool loading = false;

  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 9 / 16,
          autoPlay: true,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      BetterPlayer(
                        controller: _betterPlayerController,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedAlign(
                          duration: Duration(
                            milliseconds: 500,
                          ),
                          alignment: popUp
                              ? Alignment.bottomRight
                              : Alignment.topRight,
                          child: Image.asset('assets/docImage3.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.6),
                              ),
                              child: Center(
                                child: Text(
                                  DateTime.now().hour.toString() +
                                      ':' +
                                      DateTime.now().minute.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                child: Center(
                                  child: Icon(Icons.mic),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            CircleAvatar(
                              child: Center(
                                child: Icon(Icons.video_camera_back),
                              ),
                              backgroundColor: Colors.blue,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                child: Center(
                                  child: Icon(Icons.call_end),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  popUp = !popUp;
                                });
                              },
                              child: CircleAvatar(
                                child: Center(
                                  child: Icon(Icons.fullscreen),
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: !popUp ? 0 : MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Megha Jain',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      TabBar(
                        onTap: (index) {
                          Color temp;

                          if (index == 0 && text2 == Colors.black) {
                            setState(() {
                              temp = color1;
                              color1 = color2;
                              color2 = temp;
                              temp = text1;
                              text1 = text2;
                              text2 = temp;
                            });
                          } else if (index == 1 && text1 == Colors.black) {
                            setState(() {
                              temp = color1;
                              color1 = color2;
                              color2 = temp;
                              temp = text1;
                              text1 = text2;
                              text2 = temp;
                            });
                          }
                        },
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: color1,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 3,
                                    color: Colors.grey.withOpacity(0.15),
                                  ),
                                ]),
                            child: Tab(
                              child: Text(
                                'Summary',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: text2,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.2,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: color2),
                            child: Tab(
                              child: Text(
                                'Reports',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: text1,
                                ),
                              ),
                            ),
                          )
                        ],
                        controller: _controller,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            VideoTab1(),
                            VideoTab2(),
                          ],
                          controller: _controller,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
