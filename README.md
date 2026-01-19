# bloc_skeleton_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# bloc_base_project


# Development
flutter run --flavor dev -t lib/main_dev.dart

# Staging
flutter run --flavor staging -t lib/main_staging.dart

# Production
flutter run --flavor prod -t lib/main_prod.dart

# Build APK
flutter build apk --flavor dev -t lib/main_dev.dart
flutter build apk --flavor prod -t lib/main_prod.dart



project/
├── lib/
│   ├── main_dev.dart
│   ├── main_staging.dart
│   ├── main_prod.dart
│   ├── app.dart
│   │
│   ├── core/
│   │   ├── config/
│   │   │   ├── app_config.dart
│   │   │   └── env_config.dart
│   │   │
│   │   ├── network/
│   │   │   ├── dio_client.dart
│   │   │   ├── api_endpoints.dart
│   │   │   ├── api_response.dart
│   │   │   ├── network_info.dart
│   │   │   └── interceptors/
│   │   │       ├── auth_interceptor.dart
│   │   │       ├── logging_interceptor.dart
│   │   │       └── error_interceptor.dart
│   │   │
│   │   ├── error/
│   │   │   ├── failures.dart
│   │   │   ├── exceptions.dart
│   │   │   └── error_handler.dart
│   │   │
│   │   ├── constants/
│   │   │   ├── api_constants.dart
│   │   │   ├── app_constants.dart
│   │   │   └── storage_constants.dart
│   │   │
│   │   └── di/
│   │       ├── injection.dart
│   │       └── injection.config.dart
│   │
│   └── features/
│       └── (as before)
│
├── android/
│   └── app/
│       └── build.gradle  (flavor configuration)
│
└── ios/
└── (flavor configuration)



