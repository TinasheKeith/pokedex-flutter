import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final Color primaryColor = Color(0xFFEA5D60);
  final Color canvasColor = Colors.white;

  final Color canvasColorDark = Color(0xFF23272D);

  ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: canvasColor,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      textTheme: GoogleFonts.notoSansTextTheme(),
      primaryColor: primaryColor,
      canvasColor: canvasColor,
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: canvasColorDark,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: GoogleFonts.notoSansTextTheme().copyWith(
        display2: TextStyle(color: Colors.white30)
      ),
      primaryColor: primaryColor,
      canvasColor: canvasColorDark,
    );
  }
}
