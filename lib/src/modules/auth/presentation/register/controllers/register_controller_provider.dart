import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/domain/usecases/register_user_usecase_provider.dart';
import 'package:thrive/src/modules/auth/presentation/register/controllers/register_controller.dart';
import 'package:thrive/src/modules/auth/presentation/register/controllers/register_state.dart';

final registerControllerProvider = StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
  final usecase = ref.watch(registerUserUsecaseProvider);
  return RegisterController(usecase);
});