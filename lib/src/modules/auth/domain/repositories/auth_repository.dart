import 'package:thrive/src/shared/entities/user.dart';

abstract class AuthRepository {
  Future<User> registerUser({
    required String username,
    required String email,
    required String password,
  });

  Future<User> loginUser({
    required String email,
    required String password,
  });
}