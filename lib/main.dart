import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/screens/Profile.dart';
import 'package:doctor_app/screens/Schedule.dart';
import 'package:doctor_app/widgets/BottomNavigationBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/screens/DashBoard.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (ctx) => ModeChange(),
      child: MaterialApp(
        home: BottomNavigationBarWidget(),

        debugShowCheckedModeBanner: false,

        // theme:

        // darkTheme: ,
      ),
    ));
