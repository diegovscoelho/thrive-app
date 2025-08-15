import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/data/repositories/auth_repository_impl_provider.dart';
import 'package:thrive/src/modules/auth/domain/usecases/login_user_usecase.dart';

final loginUserUsecaseProvider = Provider<LoginUserUsecase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUserUsecase(repository);
});