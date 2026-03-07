import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? role;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? token;
  final String? refreshToken;

  const User({
    required this.id,
    required this.email,
    this.name,
    this.role,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        role,
        emailVerifiedAt,
        createdAt,
        updatedAt,
        token,
        refreshToken,
      ];

  @override
  String toString() {
    return 'User{id: $id, email: $email, name: $name, role: $role, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt, token: $token, refreshToken: $refreshToken}';
  }
}
