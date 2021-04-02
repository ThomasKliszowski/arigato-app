import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArigatoStyle {
  static final theme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.openSansTextTheme().copyWith(
      caption: GoogleFonts.openSansCondensed(),
    ),
  );
}
