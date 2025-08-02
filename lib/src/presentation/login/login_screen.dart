import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrive/src/core/utils/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF004d40), Color(0xFF388e3c)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Column(
            children: [
              Text(
                'Thrive',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    CustomTextField(labelText: 'E-mail'),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: 'Senha'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
