import '../../features/auth/domain/repositories/auth_repository.dart';
import '../routes/app_routes.dart';
import 'auth_session.dart';

class AppStartup {
  static Future<String> determineInitialRoute(
      AuthRepository authRepository) async {
    final session = AuthSession();
    await session.init(authRepository);
    return session.isAuthenticated ? AppRoutes.dashboard : AppRoutes.login;
  }
}
