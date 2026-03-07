import 'package:flutter/material.dart';
import 'core/config/app_config.dart';
import 'core/config/env_config.dart';
import 'core/di/injection.dart';
import 'main.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Development Environment
  AppConfig.initialize(EnvConfig.dev);

  // Setup dependency injection
  await configureDependencies();

  runApp(const MyApp());
}