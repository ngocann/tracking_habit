import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() {
  const Color accentColor = Color(0xFF0157ff);
  return ThemeData(
    primaryColor: accentColor,
    primaryColorDark: accentColor,
    accentColor: accentColor,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      caption: TextStyle(color: accentColor),
      headline4: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1A1A1A)),
      headline5: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A1A1A)),
      bodyText2: TextStyle(fontSize: 14.0, color: Color(0xFF425b78)),
    ),
    cardTheme: CardTheme(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        )),
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      space: 1.0,
    ),
  );
}
