import 'package:badges/badges.dart';
import 'package:doctor_app/provider/modeChange.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  AppBarWidget(this.title) : preferredSize = Size.fromHeight(kToolbarHeight);
  @override
  final Size preferredSize;
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: HexColor('#F1F5F4'),
      elevation: 0,
      title: FittedBox(
        child: Text(
          widget.title,
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      actions: [
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Provider.of<ModeChange>(context).toggle();
                });
              },
              child: Switch(
                focusColor: Colors.greenAccent,
                value: Provider.of<ModeChange>(context).darkMode,
                onChanged: (c) {},
              ),
            ),
            Text('Online',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                )),
            Stack(
              children: [
                Icon(Icons.notifications),
                Positioned(
                  left: 10,
                  // alignment: Alignment.topRight,
                  child: CircleAvatar(
                    maxRadius: 6,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
