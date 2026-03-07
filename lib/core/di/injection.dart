import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_skeleton_project/core/database/database.dart';
import 'injection.config.dart';
import '../session/session_cubit.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // Initialize injectable
  await getIt.init();
  if (!getIt.isRegistered<SessionCubit>()) {
    getIt.registerSingleton<SessionCubit>(
      SessionCubit(getIt<AuthRepository>()),
    );
  }
}

@module
abstract class RegisterModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @preResolve
  Future<AppDatabase> get appDatabase async {
    final database = AppDatabase();
    // Force-open connection so the sqlite file exists for inspector/tools.
    await database.customSelect('SELECT 1').get();
    return database;
  }
}
