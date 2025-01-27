import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFEFEFEF), // Very Light Gray
  scaffoldBackgroundColor: const Color(0xFFEFEFEF),

  colorScheme: ColorScheme.light(
    primary: const Color(0xFF5C6BC0), // Azul claro del título TODO
    secondary: const Color(0xFFB3E5FC), // Azul más tenue del fondo
    surface: const Color(0xFFFFFFFF), // Blanco del fondo principal
    // onBackground: const Color(0xFFE3F2FD), // Azul muy claro
    onPrimary: const Color(0xFF212121), // Gris oscuro para el texto
    onSecondary: const Color(0xFF757575), // Gris medio para íconos
  ),
  textTheme: GoogleFonts.josefinSansTextTheme(),
);
