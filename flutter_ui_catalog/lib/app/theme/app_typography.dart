import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTypography {
  static TextTheme textTheme(TextTheme base) {
    return GoogleFonts.interTextTheme(base);
  }
}
