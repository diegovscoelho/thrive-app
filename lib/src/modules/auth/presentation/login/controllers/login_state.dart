import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isFormValid,
    String? errorMessage,
    String? emailError,
    String? passwordError,
  }) = _LoginState;
}