import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/domain/usecases/login_user_usecase.provider.dart';
import 'package:thrive/src/modules/auth/presentation/login/controllers/login_controller.dart';
import 'package:thrive/src/modules/auth/presentation/login/controllers/login_state.dart';

final loginControllerProvider = StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  final usecase = ref.watch(loginUserUsecaseProvider);
  return LoginController(usecase);
});