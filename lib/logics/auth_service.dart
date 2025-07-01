import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  static final AuthService instance = AuthService._internal();
  AuthService._internal();

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  /// Simulate loading user session (replace with real logic)
  Future<void> init() async {
    // TODO: Load session from secure storage or backend
    await Future.delayed(const Duration(milliseconds: 300));
    // _isAuthenticated = ...; // Set based on real session
  }

  /// Call this on successful login
  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  /// Call this on logout
  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }

  /// Simulate registration (replace with real logic)
  Future<void> register(String email, String password, String name) async {
    // TODO: Implement real registration logic (e.g., call backend)
    await Future.delayed(const Duration(milliseconds: 300));
    _isAuthenticated = true;
    notifyListeners();
  }
}
