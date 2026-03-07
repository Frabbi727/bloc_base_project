import 'package:flutter/material.dart';
import 'core/config/app_config.dart';
import 'core/config/env_config.dart';
import 'core/di/injection.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Staging Environment
  AppConfig.initialize(EnvConfig.staging);

  await configureDependencies();

  runApp(const MyApp());
}