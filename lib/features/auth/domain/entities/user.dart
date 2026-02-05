import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? token;
  final String? refreshToken;

  const User({
    required this.id,
    required this.email,
    this.name,
    this.token,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [id, email, name, token, refreshToken];
}
