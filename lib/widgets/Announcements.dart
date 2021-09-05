import 'package:doctor_app/provider/modeChange.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cardWidget.dart';

class Announcements extends StatefulWidget {
  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);

    return Column(
      children: [
        SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Timing',
              style: GoogleFonts.roboto(
                color: pro.darkMode ? Colors.white : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  'per patient time',
                  style: GoogleFonts.roboto(
                    color: pro.darkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 3,
                        color: Colors.grey.withOpacity(0.15),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '20 min',
                      ),
                      Icon(Icons.arrow_downward),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            children: [
              CardWidget(
                'Monday',
              ),
              CardWidget(
                'Tuesday',
              ),
              CardWidget(
                'Wednesday',
              ),
              CardWidget(
                'Thursday',
              ),
              CardWidget(
                'Friday',
              ),
            ],
          ),
        )
      ],
    );
  }
}
