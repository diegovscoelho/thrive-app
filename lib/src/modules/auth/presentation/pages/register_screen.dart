import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thrive/src/core/utils/custom_primary_button.dart';
import 'package:thrive/src/core/utils/custom_text_field.dart';
import 'package:thrive/src/modules/auth/presentation/controllers/register_controller_provider.dart';

// TODO: Implementar confirmação de cadatro e redirecionamento para tela de login
class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.watch(registerControllerProvider.notifier);

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
                    CustomTextField(
                      labelText: 'Nome de usuário',
                      controller: controller.usernameController,
                      errorMessage: state.usernameError,
                      onChanged: (value) => controller.validateUsername(value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'E-mail',
                      controller: controller.emailController,
                      errorMessage: state.emailError,
                      onChanged: (value) => controller.validateEmail(value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Senha',
                      controller: controller.passwordController,
                      errorMessage: state.passwordError,
                      onChanged: (value) => controller.validatePassword(value),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Confirme a senha',
                      controller: controller.confirmPasswordController,
                      errorMessage: state.confirmPasswordError,
                      onChanged:
                          (value) => controller.validateConfirmPassword(value),
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    Consumer(
                      builder: (context, watch, child) {
                        final state = watch.watch(registerControllerProvider);
                        return CustomPrimaryButton(
                          onPressed:
                              (state.isLoading || !state.isFormValid)
                                  ? null
                                  : () {
                                    controller.register();
                                  },
                          text: 'Criar conta',
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    if (state.isLoading) const CircularProgressIndicator(),
                    if (state.errorMessage != null)
                      Text(
                        state.errorMessage!,
                        style: const TextStyle(color: Colors.red),
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
