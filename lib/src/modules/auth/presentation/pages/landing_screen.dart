import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thrive/src/core/utils/app_styles.dart';
import 'package:thrive/src/core/utils/custom_primary_button.dart';
import 'package:thrive/src/core/utils/custom_secondary_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

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
            colors: [Color(0xFF0f0c29), Color(0xFF302b63), Color(0xFF24243e)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 96),
              child: Text('Thrive', style: AppStyles.headline()),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 96),
                child: Column(
                  children: [
                    Text(
                      'Olá',
                      style: AppStyles.headline2(color: Color(0xFF0f0c29)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Seja bem vindo ao melhor aplicativo de controle finaceiro do Brasil',
                      style: AppStyles.descriptionStyle(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    CustomPrimaryButton(
                      onPressed: () {
                        context.push('/login');
                      },
                      text: 'Já tenho conta',
                    ),
                    const SizedBox(height: 16),
                    CustomSecondaryButton(
                      onPressed: () {
                        context.push('/register');
                      },
                      text: 'Quero me cadastrar',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
