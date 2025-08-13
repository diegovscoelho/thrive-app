import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/data/datasources/auth_api_service_provider.dart';
import 'package:thrive/src/modules/auth/data/repositories/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final apiService = ref.watch(authApiServiceProvider);
  return AuthRepositoryImpl(apiService);
});