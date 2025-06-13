import 'package:flutter/foundation.dart';

import '../repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _repository;

  String phone = '';
  String pin = '';
  bool isLoading = false;
  String? error;
  User? user;

  AuthViewModel({AuthRepository? repository})
      : _repository = repository ?? AuthRepository();

  Future<void> login() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      user = await _repository.login(phone: phone, pin: pin);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    user = null;
    notifyListeners();
  }
}
