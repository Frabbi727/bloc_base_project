import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  User? _currentUser;

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    final user = User(
      id: 'fake-user-id',
      email: email,
      name: 'Fake User',
      token: 'fake-token',
      refreshToken: 'fake-refresh-token',
    );
    _currentUser = user;
    return Right(user);
  }

  @override
  Future<Either<Failure, void>> logout() async {
    _currentUser = null;
    return const Right(null);
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    return Right(_currentUser);
  }
}
