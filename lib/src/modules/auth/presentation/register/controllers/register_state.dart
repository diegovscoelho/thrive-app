import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isFormValid,
    String? usernameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) = _RegisterState;
}