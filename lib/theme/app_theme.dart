import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta principal Verde y Blanco
  static const Color primaryGreen = Color(0xFF00C853);
  static const Color accentGreen = Color(0xFF059669);
  static const Color darkGreenText = Color(0xFF064E3B);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color surfaceCard = Color(0xFFF8FCF9);
  static const Color borderGreen = Color(0xFFA7F3D0);
  static const Color surfaceOverlay = Color(0xFFE6F4EA);
  static const Color textMain = Color(0xFF0F172A);
  static const Color textMuted = Color(0xFF64748B);

  static ThemeData get lightGreenTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundWhite,
      primaryColor: primaryGreen,
      colorScheme: const ColorScheme.light(
        primary: primaryGreen,
        secondary: accentGreen,
        surface: surfaceCard,
      ),
      fontFamily: GoogleFonts.orbitron().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundWhite.withValues(alpha: 0.95),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: darkGreenText),
        titleTextStyle: GoogleFonts.orbitron(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: darkGreenText,
          letterSpacing: 1.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.orbitron(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
