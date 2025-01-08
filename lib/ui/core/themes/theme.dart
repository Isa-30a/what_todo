import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFEFEFEF), // Very Light Gray
  scaffoldBackgroundColor: const Color(0xFFEFEFEF),

  colorScheme: ColorScheme.light(
    primary: const Color(0xFFEFEFEF), // Very Light Gray
    secondary: const Color(0xFFCAD3E0), // Very Light Grayish Blue
    surface: const Color(0xFFDADADA), // Light Grayish Blue
    background: const Color(0xFFEFEFEF), // Background color
    onPrimary: const Color(0xFF4C566A), // Dark Grayish Blue
    onSecondary: const Color(0xFF37474F), // Very Dark Grayish Blue
  ),
  textTheme: GoogleFonts.josefinSansTextTheme(),
);

