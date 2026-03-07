# Architecture and Flow

This document explains the project structure and how requests flow through the app.

## High-level structure

`lib/`
- `main.dart`: Flutter app entry widget (currently the default counter UI).
- `main_dev.dart`, `main_staging.dart`, `main_prod.dart`: Flavor entrypoints that initialize configuration and DI.
- `core/`: Cross-cutting concerns (config, DI, network, error handling, constants).
- `features/`: Feature modules (currently `auth` is the main example).

`android/` and `ios/`
- Native build configuration and flavor setup.

## Environment and flavors

Each flavor has its own entrypoint:
- `dev`: `lib/main_dev.dart`
- `staging`: `lib/main_staging.dart`
- `prod`: `lib/main_prod.dart`

Each entrypoint:
1. Ensures Flutter binding is initialized.
2. Sets `AppConfig` with a flavor-specific `EnvConfig`.
3. Initializes dependency injection.
4. Runs the app.

Configuration lives in:
- `lib/core/config/env_config.dart`: Environment definitions (base URL, API key, timeouts, logging, app name).
- `lib/core/config/app_config.dart`: Global access to the selected config.

## Dependency injection

The DI container is `get_it` with `injectable` code generation.
- Entry: `lib/core/di/injection.dart`
- Generated bindings: `lib/core/di/injection.config.dart`

`RegisterModule` provides:
- `Connectivity` (lazy singleton)
- `SharedPreferences` (pre-resolved)

Feature components (data sources, repositories, etc.) are annotated with `@LazySingleton` and auto-registered.

## Networking stack

Core network client:
- `lib/core/network/dio_client.dart`

Interceptors:
- `LoggingInterceptor`: logs requests/responses if `AppConfig.enableLogging` is true.
- `AuthInterceptor`: injects `Authorization` header, refreshes token on 401, retries request once.
- `ErrorInterceptor`: maps Dio errors to domain exceptions.

API endpoints:
- `lib/core/constants/api_constants.dart`

Response wrapper:
- `lib/core/network/api_response.dart` (generic API response model)

## Error handling

Exceptions (thrown in data layer):
- `lib/core/error/exceptions.dart`

Failures (returned to domain/UI layer):
- `lib/core/error/failures.dart`

Error mapping:
- `lib/core/error/error_handler.dart`

Usage:
- Data source throws `ServerException`, `NetworkException`, `CacheException`.
- Repository catches and maps to `Failure` via `ErrorHandler`.
- UI consumes `Either<Failure, T>` from repositories.

## Auth feature flow (example)

### Data layer
- `AuthRemoteDataSource`: calls API through `DioClient`.
- `AuthLocalDataSource`: caches token/user in `SharedPreferences`.
- `UserModel`: JSON model for API responses.

### Domain layer
- `AuthRepository`: abstract interface for auth actions.
- `User`: domain entity.

### Repository implementation
- `AuthRepositoryImpl`:
  1. Checks network connectivity.
  2. Calls remote data source.
  3. Caches user + token.
  4. Returns `Either<Failure, User>`.

## Typical request flow

1. UI triggers a use case (e.g., login).
2. Repository checks network.
3. Remote data source calls API via `DioClient`.
4. Interceptors run:
   - Auth header injected
   - Logging (if enabled)
5. Response is parsed into `UserModel`.
6. Repository caches data locally.
7. Result is returned as `Either<Failure, User>`.

## Where to extend

Add new features under `lib/features/<feature_name>/`:
- `domain/` (entities, repositories, use cases)
- `data/` (models, data sources, repository impl)
- `presentation/` (BLoC, screens, widgets)

Register new data sources/repositories with `@LazySingleton` and run:
```
dart run build_runner build --delete-conflicting-outputs
```

## Build flavors

Android flavors are configured in:
- `android/app/build.gradle.kts`

iOS flavors are configured via xcconfig and schemes in:
- `ios/Flutter/*.xcconfig`
- `ios/Runner.xcodeproj/xcshareddata/xcschemes/*.xcscheme`

## Notes

- `lib/main.dart` still uses the default counter UI and can be replaced later.
- Use `AppConfig` to access environment-specific values anywhere in the app.
