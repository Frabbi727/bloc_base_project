import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/session/session_cubit.dart';
import '../../domain/repositories/auth_repository.dart';
import '../bloc/login/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _submit(BuildContext context) {
    final state = context.read<LoginCubit>().state;
    context.read<LoginCubit>().login(
          email: state.email,
          password: state.password,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(getIt<AuthRepository>()),
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            previous.status != current.status,
        listener: (context, state) {
          if (state.status == LoginStatus.failure &&
              state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }

          if (state.status == LoginStatus.success) {
            context.read<SessionCubit>().onLoginSuccess();
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Login')),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    final isLoading = state.status == LoginStatus.loading;
                    final canSubmit = !isLoading &&
                        state.emailError == null &&
                        state.passwordError == null &&
                        state.email.isNotEmpty &&
                        state.password.isNotEmpty;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Sign in to continue',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'you@example.com',
                            border: const OutlineInputBorder(),
                            errorText: state.emailError,
                          ),
                          onChanged: (value) =>
                              context.read<LoginCubit>().emailChanged(value),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: const OutlineInputBorder(),
                            errorText: state.passwordError,
                          ),
                          onChanged: (value) =>
                              context.read<LoginCubit>().passwordChanged(value),
                          onSubmitted: (_) => _submit(context),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed:
                                canSubmit ? () => _submit(context) : null,
                            child: isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Login'),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
