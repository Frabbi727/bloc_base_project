import 'package:flutter/material.dart';
import '../di/injection.dart';
import '../navigation/navigation_service.dart';
import '../routes/app_routes.dart';
import 'app_startup.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final route = await AppStartup.determineInitialRoute(
      getIt<AuthRepository>(),
    );

    if (!mounted) return;

    NavigationService.pushNamedAndRemoveUntil(
      route,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
