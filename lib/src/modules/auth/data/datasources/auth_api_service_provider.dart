import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thrive/src/modules/auth/data/datasources/auth_api_service.dart';

final authApiServiceProvider = Provider<AuthApiService>((ref) {
  return AuthApiService();
});