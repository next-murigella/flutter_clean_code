import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

ThemeData createDarkModeTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: createMaterialColor(Colors.black),
      primaryColor: Colors.black,
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headline1: GoogleFonts.montserrat(fontSize: 24, color: Colors.white),
        headline2: GoogleFonts.notoSans(fontSize: 20, color: Colors.white),
        headline3: GoogleFonts.notoSans(fontSize: 18, color: Colors.white),
        headline4: GoogleFonts.notoSans(fontSize: 16, color: Colors.white),
        headline5: GoogleFonts.notoSans(fontSize: 14, color: Colors.white),
        headline6: GoogleFonts.notoSans(fontSize: 12, color: Colors.white),
        subtitle1: GoogleFonts.notoSans(fontSize: 12, color: Colors.white),
        subtitle2: GoogleFonts.notoSans(fontSize: 12, color: Colors.white),
        bodyText1: GoogleFonts.montserrat(fontSize: 10, color: Colors.white),
        bodyText2: GoogleFonts.notoSans(fontSize: 16, color: Colors.white),
        button: GoogleFonts.notoSans(fontSize: 16, color: Colors.white),
        caption: GoogleFonts.notoSans(fontSize: 16, color: Colors.white),
        overline: GoogleFonts.notoSans(fontSize: 10, color: Colors.white),
      ));
}

ThemeData createLightModeTheme() {
  return ThemeData(
      brightness: Brightness.light,
      primarySwatch: createMaterialColor(Colors.black),
      primaryColor: Colors.white,
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headline1: GoogleFonts.montserrat(fontSize: 24, color: Colors.black),
        headline2: GoogleFonts.notoSans(fontSize: 20, color: Colors.black),
        headline3: GoogleFonts.notoSans(fontSize: 18, color: Colors.black),
        headline4: GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
        headline5: GoogleFonts.notoSans(fontSize: 14, color: Colors.black),
        headline6: GoogleFonts.notoSans(fontSize: 12, color: Colors.black),
        subtitle1: GoogleFonts.notoSans(fontSize: 12, color: Colors.black),
        subtitle2: GoogleFonts.notoSans(fontSize: 12, color: Colors.black),
        bodyText1: GoogleFonts.montserrat(fontSize: 10, color: Colors.black),
        bodyText2: GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
        button: GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
        caption: GoogleFonts.notoSans(fontSize: 16, color: Colors.black),
        overline: GoogleFonts.notoSans(fontSize: 10, color: Colors.black),
      ));
}
