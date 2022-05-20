import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.gloriaHallelujahTextTheme(),
    primaryColor: Colors.black,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.gloriaHallelujahTextTheme(),
    primaryColor: Colors.white,
    brightness: Brightness.dark,
  );
}
