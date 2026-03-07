// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: UserModel._idFromJson(json['id']),
  email: json['email'] as String,
  name: json['name'] as String?,
  role: json['role'] as String?,
  emailVerifiedAt: json['email_verified_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  token: json['token'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': UserModel._idToJson(instance.id),
  'email': instance.email,
  'name': instance.name,
  'role': instance.role,
  'email_verified_at': instance.emailVerifiedAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'token': instance.token,
  'refreshToken': instance.refreshToken,
};
