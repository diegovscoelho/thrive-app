import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle headline({Color? color}) {
    return GoogleFonts.montserrat(
      fontSize: 48,
      color: color ?? Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle headline2({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 24,
      color: color ?? Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle label({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      color: color ?? Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle primaryButtonStyle({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 12,
      color: color ?? Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static final TextStyle secondaryButtonStyle = GoogleFonts.poppins(
    fontSize: 12,
    color: Color(0xFF0f0c29),
    fontWeight: FontWeight.bold,
  );

  static TextStyle descriptionStyle({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    color: color ?? Color(0xFF0f0c29),
    fontWeight: FontWeight.w500,
  );
}
