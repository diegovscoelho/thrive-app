import 'package:thrive/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:thrive/src/shared/entities/user.dart';

class RegisterUserUsecase {
  RegisterUserUsecase(this.repository);
  
  final AuthRepository repository;

  Future<User> call({required String username, required String email, required String password}) async {
    if (email.isEmpty) {
      throw Exception('E-mail inválido');
    }

    return await repository.registerUser(
      username: username,
      email: email,
      password: password,
    );
  }
}