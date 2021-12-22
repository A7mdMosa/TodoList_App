import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.patrickHand(
      fontSize: 23.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: const Color(0xff0B2052),
    ),
    bodyText2: GoogleFonts.patrickHand(
      fontSize: 23.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: const Color(0xff88A1A1),
    ),
    headline1: GoogleFonts.sourceSansPro(
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xffD34251),
    ),
    headline2: GoogleFonts.sourceSansPro(
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: const Color(0xff0B2052),
    ),
  );

  static ThemeData light() {
    return ThemeData(
      textTheme: lightTextTheme,
      brightness: Brightness.light,
      primaryColor: const Color(0xffFFF8EB),
      colorScheme: const ColorScheme.light(
        primary: Color(0xff0B2052),
        secondary: Color(0xffD2717C),
        error: Color(0xffEE3D53),
      ),
    );
  }

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.patrickHand(
      fontSize: 23.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: const Color(0xffFFFFFF),
    ),
    bodyText2: GoogleFonts.patrickHand(
      fontSize: 23.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: const Color(0xffB6D5D5),
    ),
    headline1: GoogleFonts.sourceSansPro(
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xffFFFFFF),
    ),
    headline2: GoogleFonts.sourceSansPro(
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1,
      color: const Color(0xffFFFFFF),
    ),
  );

  static ThemeData dark() {
    return ThemeData(
      textTheme: darkTextTheme,
      brightness: Brightness.light,
      primaryColor: const Color(0xff000000),
      colorScheme: const ColorScheme.light(
        primary: Color(0xffFFFFFF),
        secondary: Color(0xffD2717C),
        error: Color(0xffFA979D),
      ),
    );
  }
}
