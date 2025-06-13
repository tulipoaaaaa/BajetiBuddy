import 'package:bajeti_buddy/main.dart';

import '../models/user_model.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({AuthService? authService})
      : _authService = authService ?? AuthService();

  Future<User?> login({required String phone, required String pin}) async {
    try {
      // TODO: invoke AuthService.login and parse response
      return null;
    } catch (e) {
      // TODO: map exceptions to user-friendly errors
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      // TODO: invoke AuthService.logout
    } catch (e) {
      // TODO: handle logout errors
      rethrow;
    }
  }
}
