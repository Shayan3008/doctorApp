import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/widgets/Announcements.dart';
import 'package:doctor_app/widgets/AppBar.dart';
import 'package:doctor_app/widgets/BottomNavigationBarWidget.dart';
import 'package:doctor_app/widgets/ChatSchedule.dart';
import 'package:doctor_app/widgets/Drawer.dart';
import 'package:doctor_app/widgets/cardWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Schedule extends StatefulWidget {
  static const routeName = '/schedule';

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> with TickerProviderStateMixin {
  late TabController _controller;
  Color color1 = HexColor('#04C5C2');
  Color color2 = Colors.white;
  Color text1 = Colors.black;
  Color text2 = Colors.white;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: pro.theme.scaffoldBackgroundColor,
      drawer: DrawerWidget(),
      appBar: AppBarWidget('Schedule'),
      body: Center(
        child: Container(
          width: size.width * 1,
          child: Column(
            children: [
              PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
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
                            'Announcements',
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
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 3,
                                color: Colors.grey.withOpacity(0.15),
                              ),
                            ],
                            color: color2),
                        child: Tab(
                          child: Text(
                            'Chats',
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
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Announcements(),
                    ChatAnnouncements(),
                  ],
                  controller: _controller,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
