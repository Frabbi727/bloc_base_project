import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/error_handler.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(const LoginState());

  void emailChanged(String value) {
    final trimmed = value.trim();
    emit(
      state.copyWith(
        email: trimmed,
        emailError: _validateEmail(trimmed),
        status: LoginStatus.initial,
        errorMessage: null,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        passwordError: _validatePassword(value),
        status: LoginStatus.initial,
        errorMessage: null,
      ),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final emailError = _validateEmail(email);
    final passwordError = _validatePassword(password);
    if (emailError != null || passwordError != null) {
      emit(
        state.copyWith(
          emailError: emailError,
          passwordError: passwordError,
          status: LoginStatus.failure,
          errorMessage: 'Please fix the errors above',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: LoginStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await authRepository.login(email, password);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: ErrorHandler.getErrorMessage(failure),
        ),
      ),
      (_) => emit(state.copyWith(status: LoginStatus.success)),
    );
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) return 'Email is required';
    if (!value.contains('@')) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }
}
