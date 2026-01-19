import 'env_config.dart';

class AppConfig {
  static late EnvConfig _config;

  static void initialize(EnvConfig config) {
    _config = config;
  }

  static EnvConfig get config => _config;
  static String get baseUrl => _config.baseUrl;
  static String get apiKey => _config.apiKey;
  static bool get enableLogging => _config.enableLogging;
  static Environment get environment => _config.environment;
}