import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final bool success;
  final String message;
  final UserModel user;
  final String token;

  AuthResponseModel({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);

  UserModel get userWithToken => user.copyWith(token: token);

  @override
  String toString() {
    return 'AuthResponseModel{success: $success, message: $message, user: $user, token: $token}';
  }
}
