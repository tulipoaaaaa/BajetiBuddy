import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthController controller;

  String phone = '';
  String pin = '';
  bool isLoading = false;
  String? errorMessage;

  AuthViewModel({required this.controller});

  Future<bool> attemptLogin() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final success = await controller.login(phone, pin);
    if (!success) {
      errorMessage = controller.error;
    }

    isLoading = false;
    notifyListeners();
    return success;
  }
}
