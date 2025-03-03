import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VSThemes {
  static final backgroundColor = Colors.white;

  static final darkBackgroundColor = Color(0xff111111);

  static ThemeData theme() => ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            enableFeedback: false,
            selectedItemColor: darkBackgroundColor,
            unselectedItemColor: darkBackgroundColor.withValues(alpha: 0.7),
            backgroundColor: backgroundColor),
        textTheme: GoogleFonts.robotoTextTheme(),
      );

  static ThemeData darkTheme() => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBackgroundColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            enableFeedback: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: darkBackgroundColor),
        textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
      );
}
