import 'package:flutter/material.dart';
import 'core/config/app_config.dart';
import 'core/config/env_config.dart';
import 'app.dart';
import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Production Environment
  AppConfig.initialize(EnvConfig.prod);

  await configureDependencies();

  runApp(const MyApp());
}