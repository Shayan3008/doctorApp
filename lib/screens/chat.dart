import 'package:doctor_app/models/chatBubble.dart';
import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/screens/VideoCall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class Chat extends StatefulWidget {
  final String name;
  Chat(this.name);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> newList = ["Call Patient", "Status Report", "Report Patient"];
  String value = "Call Patient";
  TextEditingController newMsg = TextEditingController();
  List<ChatBubbles> str = [];

  bool click = false;
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);
    return Scaffold(
      backgroundColor: pro.darkMode ? Colors.grey[400] : HexColor('#F1F5F4'),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 56,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset('assets/backArrowIcon.png')),
                      SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        maxRadius: 18,
                        child: Image.asset('assets/profile1.png'),
                      ),
                    ],
                  ),
                  Text(widget.name),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => VideoCall()));
                        },
                        child: Icon(
                          Icons.video_camera_back,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            click = !click;
                          });
                        },
                        child: Icon(Icons.more_vert),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (ctx, index) => ChatBubble(
                            clipper:
                                ChatBubbleClipper2(type: BubbleType.sendBubble),
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 20),
                            backGroundColor: Colors.blue,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                str[index].msg,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          itemCount: str.length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: newMsg,
                                decoration:
                                    InputDecoration(hintText: 'Enter text!'),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/sendIcon.png'),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      str.add(ChatBubbles(
                                          newMsg.text, DateTime.now()));
                                      newMsg.text = '';
                                    });
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: HexColor('#04C5C2'),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  click
                      ? Transform.translate(
                          offset: Offset(0, -18),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: AnimatedContainer(
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height:
                                  MediaQuery.of(context).size.height * 0.195,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Call patient',
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: HexColor('#0B556F')),
                                      )),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Status Update',
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: HexColor('#0B556F')),
                                      )),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Report User',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: HexColor('#0B556F'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
