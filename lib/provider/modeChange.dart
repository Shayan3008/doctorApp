import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ModeChange with ChangeNotifier {
  bool darkMode = false;
  void toggle() {
    darkMode = !darkMode;
    print(darkMode);
    notifyListeners();
  }

  ThemeData light = ThemeData(
    iconTheme: IconThemeData(color: HexColor('#0B556F')),
    scaffoldBackgroundColor: HexColor('#F1F5F4'),
    textTheme: TextTheme(
      bodyText2: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline1: GoogleFonts.roboto(
        fontSize: 16,
      ),
      headline2: GoogleFonts.roboto(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      bodyText1: GoogleFonts.roboto(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    backgroundColor: HexColor('#F1F5F4'),
  );

  ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black12,
    textTheme: TextTheme(
      bodyText2: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headline1: GoogleFonts.roboto(
        fontSize: 16,
        color: Colors.white,
      ),
      headline2: GoogleFonts.roboto(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      bodyText1: GoogleFonts.roboto(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: HexColor('#F1F5F4'),
  );

  ThemeData get theme => darkMode == false ? light : dark;
}
