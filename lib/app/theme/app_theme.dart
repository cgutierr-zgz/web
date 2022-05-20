import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.gloriaHallelujahTextTheme(),
    //colorScheme: ColorScheme.fromSeed(),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.gloriaHallelujahTextTheme(),
    brightness: Brightness.dark,
  );
}
