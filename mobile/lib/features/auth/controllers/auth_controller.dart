import 'package:flutter/material.dart';

import '../services/auth_service.dart';

// TODO: Replace with actual MpesaService implementation and import
class MpesaService {}

class AuthController extends ChangeNotifier {
  final AuthService authService;
  final MpesaService mpesaService;

  bool _loading = false;
  String? _error;

  bool get isLoading => _loading;
  String? get error => _error;

  AuthController({required this.authService, required this.mpesaService});

  Future<bool> login(String phone, String pin) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final success = await authService.validatePin(phone, pin);
      if (success) {
        // TODO: Trigger Mpesa verification if needed
      }
      return success;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    // TODO: Clear user session and tokens
    notifyListeners();
  }
}
