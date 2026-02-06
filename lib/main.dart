import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/navigation/navigation_service.dart';
import 'core/navigation/route_observer.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/session/session_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SessionCubit>(),
      child: BlocListener<SessionCubit, SessionState>(
        listenWhen: (previous, current) =>
            previous.status != current.status ||
            previous.message != current.message,
        listener: (context, state) async {
          if (state.status == SessionStatus.authenticated) {
            NavigationService.resetToDashboard();
          } else {
            await NavigationService.resetToLogin();
            if (state.message != null && state.message!.isNotEmpty) {
              NavigationService.showSnackBar(state.message!);
            }
          }
        },
        child: MaterialApp(
          title: AppConfig.isInitialized ? AppConfig.appName : 'Flutter Demo',
          navigatorKey: NavigationService.navigatorKey,
          navigatorObservers: [appRouteObserver],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
