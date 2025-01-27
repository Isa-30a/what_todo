import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF212121), // Gris oscuro para el fondo principal
  scaffoldBackgroundColor: const Color(0xFF121212), // Fondo aún más oscuro

  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF5C6BC0),
    secondary:
        const Color(0xFFB3E5FC), // Azul tenue para los fondos de secciones
    surface: const Color(0xFF1E1E1E), // Gris muy oscuro para áreas elevadas
    onPrimary: const Color(0xFFEFEFEF), // Gris claro para el texto principal
    onSecondary:
        const Color(0xFFB0BEC5), // Gris medio para elementos secundarios
    // background: const Color(0xFF121212), // Fondo principal (oscuro)
    error: const Color(0xFFCF6679), // Rojo para errores
    onSurface:
        const Color(0xFFE0E0E0), // Color claro para texto sobre fondo oscuro
  ),
  textTheme: GoogleFonts.josefinSansTextTheme(
    ThemeData.dark().textTheme,
  ).apply(
    bodyColor: const Color(0xFFEFEFEF), // Color claro para el texto principal
    displayColor: const Color(0xFFB3E5FC), // Color suave para títulos
  ),
);
