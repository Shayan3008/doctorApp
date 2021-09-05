import 'package:doctor_app/provider/modeChange.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cardWidget.dart';

class ChatAnnouncements extends StatefulWidget {
  @override
  _ChatAnnouncementsState createState() => _ChatAnnouncementsState();
}

class _ChatAnnouncementsState extends State<ChatAnnouncements> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Timing',
                style: GoogleFonts.roboto(
                  color: pro.darkMode ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
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
