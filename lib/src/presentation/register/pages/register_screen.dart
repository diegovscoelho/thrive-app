import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrive/src/core/utils/custom_primary_button.dart';
import 'package:thrive/src/core/utils/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            colors: [Color(0xFF0f0c29), Color(0xFF24243e), Color(0xFF302b63)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 96.0),
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
                    CustomTextField(labelText: 'Nome de usuário'),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: 'E-mail'),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: 'Senha'),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: 'Confirme a senha'),
                    const SizedBox(height: 32),
                    CustomPrimaryButton(
                      onPressed: () {},
                      text: 'Criar conta',
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    ),
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