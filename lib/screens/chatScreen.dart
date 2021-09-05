import 'dart:ui';
import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/widgets/AppBar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/chatBubble.dart';
import 'chat.dart';
import '../widgets/Drawer.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool switched = false;
  final List<Chats> user = [
    Chats(
      name: 'Amanullah khan',
      status: 'are u availabe on monday',
      mssg: 22,
    ),
    Chats(
      name: 'Amanullah khan',
      status: 'thank you !',
      mssg: 22,
    ),
    Chats(
      name: 'Sanjay yadav',
      status: 'This is my report plz check :)',
      mssg: 22,
    ),
    Chats(
      name: 'Sanjay chakarvadi',
      status: 'I am feeling better :)',
      mssg: 22,
    ),
    Chats(
      name: 'Sanjay  ',
      status: 'thank you! :)',
      mssg: 22,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);
    return Scaffold(
      backgroundColor: pro.theme.scaffoldBackgroundColor,
      drawer: DrawerWidget(),
      appBar: AppBarWidget(
        'Chats',
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search clinic',
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            user.isEmpty
                ? Container()
                : Expanded(
                    child: ListView.builder(
                      itemCount: user.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-2, 5),
                                  color: Colors.grey.withOpacity(0.15)),
                            ],
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Card(
                            child: Container(
                              margin: EdgeInsets.only(top: 4, bottom: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    Chat(user[index].name)));
                                      },
                                      leading: CircleAvatar(
                                        radius: 26,
                                        backgroundColor: HexColor('#0BB556F'),
                                        child:
                                            Image.asset('assets/profile1.png'),
                                      ),
                                      title: Column(
                                        children: [
                                          Text(
                                            user[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Colors.grey
                                                      .withOpacity(0.9),
                                                  size: 18,
                                                ),
                                                Container(
                                                    width: 120,
                                                    child: Text(
                                                        user[index].status)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            DateTime.now().hour > 12
                                                ? DateTime.now()
                                                        .hour
                                                        .toString() +
                                                    ':' +
                                                    DateTime.now()
                                                        .minute
                                                        .toString() +
                                                    'pm'
                                                : DateTime.now()
                                                        .hour
                                                        .toString() +
                                                    ':' +
                                                    DateTime.now()
                                                        .minute
                                                        .toString() +
                                                    'am',
                                            style: TextStyle(
                                              color: HexColor('#04C5C2'),
                                            ),
                                          ),
                                          CircleAvatar(
                                            maxRadius: 10,
                                            backgroundColor:
                                                HexColor('#04C5C2'),
                                            child: Text(
                                              user[index].mssg.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
