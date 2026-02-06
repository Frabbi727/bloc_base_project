import '../../features/auth/domain/repositories/auth_repository.dart';

class AuthSession {
  static final AuthSession _instance = AuthSession._internal();
  factory AuthSession() => _instance;
  AuthSession._internal();

  bool _initialized = false;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isInitialized => _initialized;

  Future<void> init(AuthRepository authRepository) async {
    final result = await authRepository.getCurrentUser();
    _isAuthenticated = result.fold((_) => false, (user) => user != null);
    _initialized = true;
  }

  void markAuthenticated() {
    _isAuthenticated = true;
    _initialized = true;
  }

  void markLoggedOut() {
    _isAuthenticated = false;
    _initialized = true;
  }
}
