import 'package:thrive/src/modules/auth/data/datasources/auth_api_service.dart';
import 'package:thrive/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:thrive/src/shared/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<User> registerUser({required String username, required String email, required String password}) async {
    final response = await apiService.register(username, email, password);
    final userData = response['user'];
    return User(
      id: userData['id'].toString(),
      username: userData['username'],
      email: userData['email'],
    );
  }

  @override
  Future<User> loginUser({required String email, required String password}) async {
    final response = await apiService.login(email, password);
    final userData = response['user'];
    return User(
      id: userData['id'].toString(),
      username: userData['username'],
      email: userData['email'],
    );
  }
}