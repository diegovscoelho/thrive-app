import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/domain/usecases/register_user_usecase_provider.dart';
import 'package:thrive/src/modules/auth/presentation/controllers/register_controller.dart';

final registerControllerProvider = StateNotifierProvider<RegisterController, RegisterState>((ref) {
  final usecase = ref.watch(registerUserUsecaseProvider);
  return RegisterController(usecase);
});