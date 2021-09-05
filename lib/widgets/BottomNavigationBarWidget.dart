import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/screens/Appointments.dart';
import 'package:doctor_app/screens/DashBoard.dart';
import 'package:doctor_app/screens/Schedule.dart';
import 'package:doctor_app/screens/VideoCall.dart';
import 'package:doctor_app/screens/chat.dart';
import 'package:doctor_app/screens/chatScreen.dart';
import 'package:doctor_app/screens/clinic.dart';
import 'package:doctor_app/widgets/Announcements.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int indexs = 0;
  List<Widget> list = [
    DashBoard(),
    Schedule(),
    ChatScreen(),
    ClinicScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: pro.darkMode ? Colors.white : Colors.blue,
        backgroundColor: pro.theme.scaffoldBackgroundColor,
        currentIndex: indexs,
        onTap: (index) {
          setState(() {
            indexs = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.widgets,
              ),
              label: 'DashBoard'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.schedule,
              ),
              label: 'Schedule'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.desktop_access_disabled,
              ),
              label: 'Clinic'),
        ],
      ),
      body: list[indexs],
    );
  }
}
