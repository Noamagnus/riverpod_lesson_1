import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_riverpod/core/theming/custom_colors.dart';

class CustomTheme {
  static ThemeData get appTheme {
    return ThemeData(
      primaryColor: CustomColors.mediumOrange,
      scaffoldBackgroundColor: CustomColors.darkBlue,
      textTheme: TextTheme(
        headline5: const TextStyle(color: Colors.white),
        bodyText2: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        button: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: CustomColors.mediumOrange,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: CustomColors.mediumYellow,
        ),
      ),
    );
  }
}
