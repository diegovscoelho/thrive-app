import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/domain/usecases/login_user_usecase.dart';
import 'package:thrive/src/modules/auth/presentation/login/controllers/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  final LoginUserUsecase loginUserUsecase;

  LoginController(this.loginUserUsecase) : super(const LoginState()) {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateEmail(String? email) {
    if (email != null && email.isNotEmpty) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!emailRegex.hasMatch(email)) {
        return 'Por favor, insira um e-mail válido.';
      }
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password != null && password.isNotEmpty && password.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }
    return null;
  }

  void _validateForm() {
    final emailValidation = validateEmail(emailController.text);
    final passwordValidation = validatePassword(passwordController.text);

    final bool formIsValid =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

    state = state.copyWith(
      emailError: emailController.text.isEmpty ? null : emailValidation,
      passwordError:
          passwordController.text.isEmpty ? null : passwordValidation,
      isFormValid: formIsValid,
    );
  }

  Future<void> login({VoidCallback? onSuccess,}) async {
    _validateForm();
    if (!state.isFormValid) {
      state = state.copyWith();
      return;
    }

    state = state.copyWith(isLoading: true);

    try {
      final email = emailController.text;
      final password = passwordController.text;

      await loginUserUsecase(
        email: email,
        password: password,
      );

      emailController.clear();
      passwordController.clear();
      state = state.copyWith(isLoading: false);
      onSuccess?.call();
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
