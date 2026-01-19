import 'package:bloc_skeleton_project/core/config/base_url.dart';

enum Environment { dev, staging, prod }

class EnvConfig {
  final Environment environment;
  final String baseUrl;
  final String apiKey;
  final int connectTimeout;
  final int receiveTimeout;
  final bool enableLogging;

  const EnvConfig({
    required this.environment,
    required this.baseUrl,
    required this.apiKey,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.enableLogging,
  });

  // Development Environment
  static  EnvConfig dev = EnvConfig(
    environment: Environment.dev,
    baseUrl: BaseUrl.devBaseUrl,
    apiKey: 'dev_api_key_12345',
    connectTimeout: 30000,
    receiveTimeout: 30000,
    enableLogging: true,
  );

  // Staging Environment
  static  EnvConfig staging = EnvConfig(
    environment: Environment.staging,
    baseUrl: BaseUrl.devBaseUrl,
    apiKey: 'staging_api_key_67890',
    connectTimeout: 30000,
    receiveTimeout: 30000,
    enableLogging: true,
  );

  // Production Environment
  static  EnvConfig prod = EnvConfig(
    environment: Environment.prod,
    baseUrl: BaseUrl.devBaseUrl,
    apiKey: 'prod_api_key_abcdef',
    connectTimeout: 30000,
    receiveTimeout: 30000,
    enableLogging: false,
  );

  bool get isDevelopment => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProduction => environment == Environment.prod;
}