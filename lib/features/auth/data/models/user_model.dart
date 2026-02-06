import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(fromJson: _idFromJson, toJson: _idToJson)
  final String id;
  final String email;
  final String? name;
  final String? role;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final String? token;
  final String? refreshToken;

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? token,
    String? refreshToken,
  }) {
    return UserModel(
      id: id,
      email: email,
      name: name,
      role: role,
      emailVerifiedAt: emailVerifiedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      role: role,
      emailVerifiedAt: emailVerifiedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      token: token,
      refreshToken: refreshToken,
    );
  }

  static String _idFromJson(dynamic id) => id.toString();
  static dynamic _idToJson(String id) => id;
}
