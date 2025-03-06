import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final backgroundColor = Colors.white;
  static final tabBackgroundColor = Color(0xfff2f2f2);

  static final darkBackgroundColor = Color(0xff111111);
  static final darkTabBackgroundColor = Color(0xff1a1a1a);

  static ThemeData theme() => ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            enableFeedback: false,
            selectedItemColor: darkBackgroundColor,
            unselectedItemColor: darkBackgroundColor.withValues(alpha: 0.7),
            backgroundColor: tabBackgroundColor),
        textTheme: GoogleFonts.robotoTextTheme(),
      );

  static ThemeData darkTheme() => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBackgroundColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            enableFeedback: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: darkTabBackgroundColor),
        textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
      );
}
