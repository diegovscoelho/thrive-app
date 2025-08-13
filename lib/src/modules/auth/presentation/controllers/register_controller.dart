import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/domain/usecases/register_user_usecase.dart';
import 'package:thrive/src/shared/entities/user.dart';

class RegisterState {
  final bool isLoading;
  final String? errorMessage;
  final User? user;

  RegisterState({this.isLoading = false, this.errorMessage, this.user});

  RegisterState copyWith({bool? isLoading, String? errorMessage, User? user}) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}

class RegisterController extends StateNotifier<RegisterState> {
  final RegisterUserUsecase registerUserUsecase;

  RegisterController(this.registerUserUsecase) : super(RegisterState());

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final user = await registerUserUsecase(
        username: username,
        email: email,
        password: password,
      );
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}
