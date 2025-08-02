import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  });

  final String labelText;
  final TextInputType keyboardType;

  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          color: Colors.white.withValues(alpha: 0.8),
          fontWeight: FontWeight.bold,
        ),
        fillColor: Colors.white.withValues(alpha: 0.2),
        filled: true,
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.amber, width: 2.0),
        ),
      ),
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
    );
  }
}
