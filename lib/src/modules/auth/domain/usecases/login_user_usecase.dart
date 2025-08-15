import 'package:thrive/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:thrive/src/shared/entities/user.dart';

class LoginUserUsecase {
  LoginUserUsecase(this.repository);
  
  final AuthRepository repository;

  Future<User> call({required String email, required String password}) async {
    if (email.isEmpty) {
      throw Exception('E-mail inválido');
    }

    return await repository.loginUser(
      email: email,
      password: password,
    );
  }
}