import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.errorMessage,
    this.onChanged,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? errorMessage;
  final ValueChanged<String>? onChanged;

  static const _errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  );

  @override
  Widget build(BuildContext context) {
    final Color borderColor = errorMessage != null ? Colors.red : Colors.white54;
    final double borderWidth = errorMessage != null ? 2.0 : 1.0;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white), 
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          color: Colors.white.withValues(alpha: 0.8),
          fontWeight: FontWeight.bold,
        ),
        fillColor: Colors.white.withValues(alpha: 0.1),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: borderColor,
            width:borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        errorBorder: _errorInputBorder,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: const BorderSide(color: Colors.red, width: 3.0),
        ),
        errorText: errorMessage,
        errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}