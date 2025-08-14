import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/domain/usecases/register_user_usecase.dart';
import 'package:thrive/src/modules/auth/domain/usecases/register_user_usecase_provider.dart';
import 'package:thrive/src/modules/auth/presentation/register/controllers/register_state.dart';

final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
      final registerUserUsecase = ref.watch(registerUserUsecaseProvider);
      return RegisterController(registerUserUsecase);
    });

class RegisterController extends StateNotifier<RegisterState> {
  final RegisterUserUsecase registerUserUsecase;

  RegisterController(this.registerUserUsecase) : super(const RegisterState()) {
    usernameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? validateUsername(String? username) {
    if (username != null && username.isNotEmpty && username.length < 3) {
      return 'O nome de usuário deve ter pelo menos 3 caracteres.';
    }
    return null;
  }

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

  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword != null &&
        confirmPassword.isNotEmpty &&
        confirmPassword != passwordController.text) {
      return 'As senhas não coincidem.';
    }
    return null;
  }

  void _validateForm() {
    final usernameValidation = validateUsername(usernameController.text);
    final emailValidation = validateEmail(emailController.text);
    final passwordValidation = validatePassword(passwordController.text);
    final confirmPasswordValidation = validateConfirmPassword(
      confirmPasswordController.text,
    );

    final bool formIsValid =
        usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        usernameValidation == null &&
        emailValidation == null &&
        passwordValidation == null &&
        confirmPasswordValidation == null;

    state = state.copyWith(
      usernameError:
          usernameController.text.isEmpty ? null : usernameValidation,
      emailError: emailController.text.isEmpty ? null : emailValidation,
      passwordError:
          passwordController.text.isEmpty ? null : passwordValidation,
      confirmPasswordError:
          confirmPasswordController.text.isEmpty
              ? null
              : confirmPasswordValidation,
      isFormValid: formIsValid,
    );
  }

  Future<void> register() async {
    _validateForm();
    if (!state.isFormValid) {
      state = state.copyWith(
        errorMessage: 'Por favor, corrija os erros no formulário.',
      );
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final username = usernameController.text;
      final email = emailController.text;
      final password = passwordController.text;

      await registerUserUsecase(
        username: username,
        email: email,
        password: password,
      );

      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      state = state.copyWith(isLoading: false, errorMessage: null);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  @override
  void dispose() {
    usernameController.removeListener(_validateForm);
    emailController.removeListener(_validateForm);
    passwordController.removeListener(_validateForm);
    confirmPasswordController.removeListener(_validateForm);

    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
