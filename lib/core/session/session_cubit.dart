import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../startup/auth_session.dart';

enum SessionStatus { authenticated, unauthenticated }

class SessionState {
  final SessionStatus status;
  final String? message;

  const SessionState(this.status, {this.message});
}

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepository;
  bool _logoutInProgress = false;

  SessionCubit(this.authRepository)
      : super(const SessionState(SessionStatus.unauthenticated));

  void onLoginSuccess() {
    AuthSession().markAuthenticated();
    emit(const SessionState(SessionStatus.authenticated));
  }

  Future<void> logout({bool remote = true, String? message}) async {
    if (_logoutInProgress) return;
    _logoutInProgress = true;
    try {
      if (remote) {
        await authRepository.logout();
      }
      AuthSession().markLoggedOut();
      emit(SessionState(SessionStatus.unauthenticated, message: message));
    } finally {
      _logoutInProgress = false;
    }
  }
}
